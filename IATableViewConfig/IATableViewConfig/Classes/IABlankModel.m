//
//  IABlankModel.m
//  IATableView
//
//  Created by feng on 2020/12/4.
//

#import "IABlankModel.h"

@implementation IABlankModel
+ (instancetype) modelWithColor:(UIColor *)color height:(CGFloat)height {
    IABlankModel *model = IABlankModel.new;
    model.color = color;
    model.height = height;
    return model;
}
+ (instancetype) modelWithColor:(UIColor *)color height:(CGFloat)height leftPadding:(NSInteger)leftPadding rightPadding:(NSInteger)rightPadding {
    IABlankModel *model = IABlankModel.new;
    model.color = color;
    model.height = height;
    model.leftPadding = leftPadding;
    model.rightPadding = rightPadding;
    return model;
}
@end
