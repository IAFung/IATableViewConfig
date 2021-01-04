//
//  IACellManager.h
//  IATableView
//
//  Created by feng on 2020/12/4.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "IACellConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface IACellManager : NSObject
@property(nonatomic, weak) UITableView *tableView;
- (CGFloat)cellHeightByConfig:(IACellConfig *)config;
- (UITableViewCell *)registerCellByConfig:(IACellConfig *)config;
@end

NS_ASSUME_NONNULL_END
