//
//  IATableViewReloader.m
//  IATableView
//
//  Created by feng on 2020/12/5.
//

#import "IATableViewReloader.h"
#import "IATableViewController.h"
#import "NSObject+IATopViewController.h"

@implementation IATableViewReloader
+ (void)reloadChangedHeightCell:(IACellConfig *)config {
    [self reloadChangedHeightCell:config rowAnimation:UITableViewRowAnimationNone];
}
+ (void)reloadChangedHeightCell:(IACellConfig *)config
                   rowAnimation:(UITableViewRowAnimation)animation {
    IATableViewController *vc = (IATableViewController *)self.ia_topViewController;
    __block NSIndexPath *indexPath = nil;
    if (vc.dataList.count > 0 && [vc.dataList.firstObject isKindOfClass:NSArray.class]) {
        [vc.dataList enumerateObjectsUsingBlock:^(NSArray *object, NSUInteger section, BOOL *stop) {
            [object enumerateObjectsUsingBlock:^(IACellConfig *dto, NSUInteger index, BOOL *stop1) {
                if (config == dto) {
                    indexPath = [NSIndexPath indexPathForRow:index inSection:section];
                    *stop1 = YES;
                    *stop = YES;
                }
            }];
        }];
    }
    [vc.dataList enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        if (config == object) {
            indexPath = [NSIndexPath indexPathForRow:index inSection:0];
            *stop = YES;
        }
    }];
    if (indexPath) {
        if (animation == UITableViewRowAnimationNone) {
            [UIView performWithoutAnimation:^{
                [vc.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
        } else {
            [vc.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
        }
        
    }
}
@end
