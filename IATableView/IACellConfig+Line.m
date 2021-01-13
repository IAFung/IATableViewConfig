//
//  IACellConfig+Blank.m
//  IATableView
//
//  Created by feng on 2021/1/13.
//

#import "IACellConfig+Line.h"
#import "IABaseTableViewCell.h"
@implementation IACellConfig (Line)
//默认颜色为白色
+ (instancetype)lineWithHeight:(CGFloat)height {
    return  [self lineWithColor:UIColor.whiteColor height:height leftPadding:0 rightPadding:0];
}
//默认高度为1
+ (instancetype)lineWithColor:(UIColor *)color {
    return  [self lineWithColor:color height:1 leftPadding:0 rightPadding:0];

}
+ (instancetype)lineWithColor:(UIColor *)color
                         height:(CGFloat)height {
    return  [self lineWithColor:color height:height leftPadding:0 rightPadding:0];

}
+ (instancetype)lineWithColor:(UIColor *)color
                  leftPadding:(CGFloat)left
                 rightPadding:(CGFloat)right {
    return  [self lineWithColor:color height:1 leftPadding:left rightPadding:right];
    
}
+ (instancetype)lineWithColor:(UIColor *)color
                       height:(CGFloat)heights
                  leftPadding:(CGFloat)left
                 rightPadding:(CGFloat)right {
    return [IACellConfig configWithClass:NSStringFromClass(IABaseTableViewCell.class) isNib:NO model:[IABlankModel modelWithColor:color height:heights leftPadding:left rightPadding:right]];
}
@end
