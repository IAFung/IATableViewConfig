//
//  IATableViewReloader.h
//  IATableView
//
//  Created by feng on 2020/12/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IACellConfig.h"
NS_ASSUME_NONNULL_BEGIN

@interface IATableViewReloader : NSObject
+ (void)reloadChangedHeightCell:(IACellConfig *)config;
+ (void)reloadChangedHeightCell:(IACellConfig *)config
                   rowAnimation:(UITableViewRowAnimation)animation;
@end

NS_ASSUME_NONNULL_END
