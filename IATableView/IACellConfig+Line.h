//
//  IACellConfig+Blank.h
//  IATableView
//
//  Created by feng on 2021/1/13.
//

#import <IATableViewConfig/IATableViewConfig.h>

NS_ASSUME_NONNULL_BEGIN

@interface IACellConfig (Line)
//默认颜色为白色
+ (instancetype)lineWithHeight:(CGFloat)height;
//默认高度为1
+ (instancetype)lineWithColor:(UIColor *)color;
+ (instancetype)lineWithColor:(UIColor *)color
                         height:(CGFloat)height;
+ (instancetype)lineWithColor:(UIColor *)color
                  leftPadding:(CGFloat)left
                 rightPadding:(CGFloat)right;
+ (instancetype)lineWithColor:(UIColor *)color
                       height:(CGFloat)heights
                  leftPadding:(CGFloat)left
                 rightPadding:(CGFloat)right;
@end

NS_ASSUME_NONNULL_END
