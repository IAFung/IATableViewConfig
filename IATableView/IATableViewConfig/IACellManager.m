//
//  IACellManager.m
//  IATableView
//
//  Created by feng on 2020/12/4.
//

#import "IACellManager.h"
#import "IATableViewCellProtocol.h"
@interface IACellManager()
@property(nonatomic, strong) NSMutableDictionary *registeredCells;
@property(nonatomic, strong) NSMutableDictionary *cells;
@end

@implementation IACellManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.registeredCells = @{}.mutableCopy;
        self.cells = @{}.mutableCopy;
    }
    return self;
}
- (UITableViewCell *)registerCellByConfig:(IACellConfig *)config {
    NSAssert(self.tableView, @"未传入tableView");
    if (!_registeredCells[config.cellClass]) {
        if (config.isNib) {
            [self.tableView registerNib:[UINib nibWithNibName:config.cellClass bundle:nil] forCellReuseIdentifier:config.cellClass];
        } else {
            [self.tableView registerClass:NSClassFromString(config.cellClass) forCellReuseIdentifier:config.cellClass];
        }
        _registeredCells[config.cellClass] = config.cellClass;
    }
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:config.cellClass];
    if ([cell respondsToSelector:@selector(setCellConfig:)]) {
        [(id<IATableViewCellProtocol>)cell setCellConfig:config];
    }
    if ([cell respondsToSelector:@selector(setModel:)]) {
        [(id<IATableViewCellProtocol>)cell setModel:config.model];
    }
    return cell;
}
- (CGFloat)cellHeightByConfig:(IACellConfig *)config {
    if (!config.changedHeight && config.cachedHeight > 0 ) {
        return config.cachedHeight;
    }
    UITableViewCell *cell = [self getCell:config];
    if ([cell respondsToSelector:@selector(autoCalculateHeight)]) {
        if ([(id<IATableViewCellProtocol>)cell autoCalculateHeight]) {
            return [self dynamicHeightByConfig:config];
        }
    }
    SEL sel = NSSelectorFromString(@"cellHeightByConfig:");
    NSObject *object = config;
    if (cell && [cell respondsToSelector:sel]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:
                                    [cell methodSignatureForSelector:sel]];
        [invocation setSelector:sel];
        [invocation setTarget:cell];
        [invocation setArgument:&object atIndex:2];
        [invocation invoke];
        CGFloat height;
        [invocation getReturnValue:&height];
        if (![(id<IATableViewCellProtocol>)cell respondsToSelector:@selector(setCellConfig:)]) {
            if ([(id<IATableViewCellProtocol>)cell usingCache]) {
                config.cachedHeight = height;
            }
        }
        return height;
    }
    return 0;
}
- (UITableViewCell *)getCell:(IACellConfig *)config {
    UITableViewCell *cell;
    if (!_cells[config.cellClass]) {
        cell = [self registerCellByConfig:config];
        _cells[config.cellClass] = cell;
    } else {
        cell = _cells[config.cellClass];
    }
    return cell;
}
- (CGFloat)dynamicHeightByConfig:(IACellConfig *)config {
    NSAssert(self.tableView, @"未传入tableView");
    UITableViewCell *cell = [self getCell:config];
    [cell prepareForReuse];
    if ([cell respondsToSelector:@selector(setModel:)]) {
        [(id<IATableViewCellProtocol>)cell setModel:config.model];
    }
    CGFloat contentViewWidth = CGRectGetWidth(self.tableView.frame);
    
    CGRect cellBounds = cell.bounds;
    cellBounds.size.width = contentViewWidth;
    cell.bounds = cellBounds;
    
    CGFloat rightSystemViewsWidth = 0.0;
    for (UIView *view in self.tableView.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITableViewIndex")]) {
            rightSystemViewsWidth = CGRectGetWidth(view.frame);
            break;
        }
    }
        
    // If a cell has accessory view or system accessory type, its content view's width is smaller
    // than cell's by some fixed values.
    if (cell.accessoryView) {
        rightSystemViewsWidth += 16 + CGRectGetWidth(cell.accessoryView.frame);
    } else {
        static const CGFloat systemAccessoryWidths[] = {
            [UITableViewCellAccessoryNone] = 0,
            [UITableViewCellAccessoryDisclosureIndicator] = 34,
            [UITableViewCellAccessoryDetailDisclosureButton] = 68,
            [UITableViewCellAccessoryCheckmark] = 40,
            [UITableViewCellAccessoryDetailButton] = 48
        };
        rightSystemViewsWidth += systemAccessoryWidths[cell.accessoryType];
        }
        
        if ([UIScreen mainScreen].scale >= 3 && [UIScreen mainScreen].bounds.size.width >= 414) {
            rightSystemViewsWidth += 4;
        }
        
        contentViewWidth -= rightSystemViewsWidth;
    
    CGFloat fittingHeight = 0;
    if (contentViewWidth > 0) {
        // Add a hard width constraint to make dynamic content views (like labels) expand vertically instead
        // of growing horizontally, in a flow-layout manner.
        NSLayoutConstraint *widthFenceConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:contentViewWidth];

        // [bug fix] after iOS 10.3, Auto Layout engine will add an additional 0 width constraint onto cell's content view, to avoid that, we add constraints to content view's left, right, top and bottom.
        static BOOL isSystemVersionEqualOrGreaterThen10_2 = NO;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            isSystemVersionEqualOrGreaterThen10_2 = [UIDevice.currentDevice.systemVersion compare:@"10.2" options:NSNumericSearch] != NSOrderedAscending;
        });
            
        NSArray<NSLayoutConstraint *> *edgeConstraints;
        if (isSystemVersionEqualOrGreaterThen10_2) {
            // To avoid confilicts, make width constraint softer than required (1000)
            widthFenceConstraint.priority = UILayoutPriorityRequired - 1;
                
            // Build edge constraints
            NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
            NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cell attribute:NSLayoutAttributeRight multiplier:1.0 constant:-rightSystemViewsWidth];
            NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
            NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:cell attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
                edgeConstraints = @[leftConstraint, rightConstraint, topConstraint, bottomConstraint];
            [cell addConstraints:edgeConstraints];
        }
            
        [cell.contentView addConstraint:widthFenceConstraint];
        fittingHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        [cell.contentView removeConstraint:widthFenceConstraint];
        if (isSystemVersionEqualOrGreaterThen10_2) {
                    [cell removeConstraints:edgeConstraints];
                }
    }
    if (fittingHeight == 0) {
        fittingHeight = [cell sizeThatFits:CGSizeMake(contentViewWidth, 0)].height;
    }
    if (fittingHeight == 0) {
        // Use default row height.
        fittingHeight = 44;
    }
    if (self.tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
        fittingHeight += 1.0 / [UIScreen mainScreen].scale;
    }
    if (![(id<IATableViewCellProtocol>)cell respondsToSelector:@selector(setCellConfig:)]) {
        if ([(id<IATableViewCellProtocol>)cell usingCache]) {
            config.cachedHeight = fittingHeight;
        }
    }
    return fittingHeight;
}
@end


