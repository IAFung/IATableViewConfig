//
//  IABlankModel.h
//  IATableView
//
//  Created by feng on 2020/12/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface IABlankModel : NSObject
@property(nonatomic, strong) UIColor *color;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) NSInteger leftPadding;
@property(nonatomic, assign) NSInteger rightPadding;
+ (instancetype) modelWithColor:(UIColor *)color
                         height:(CGFloat)height;
+ (instancetype) modelWithColor:(UIColor *)color
                         height:(CGFloat)height
                    leftPadding:(NSInteger)leftPadding
                   rightPadding:(NSInteger)rightPadding;

@end

NS_ASSUME_NONNULL_END
