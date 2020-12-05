//
//  IACellConfig.h
//  IATableView
//
//  Created by feng on 2020/12/4.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
NS_ASSUME_NONNULL_BEGIN

@interface IACellConfig : NSObject
@property(nonatomic, copy) NSString *cellClass;
@property(nonatomic, assign) BOOL isNib;
@property(nonatomic, strong) id model;
@property(nonatomic, assign) CGFloat cachedHeight;
@property(nonatomic, assign) BOOL changedHeight; //改变行高
+ (instancetype)configWithClass:(NSString *)cellClass
                          isNib:(BOOL)isNib
                          model:(id)model;
+ (instancetype)nibConfigWithClass:(NSString *)cellClass
                             model:(id)model;
+ (instancetype)noNibConfigWithClass:(NSString *)cellClass
                               model:(id)model;
@end

NS_ASSUME_NONNULL_END


