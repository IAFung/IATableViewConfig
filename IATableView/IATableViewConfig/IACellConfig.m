//
//  IACellConfig.m
//  IATableView
//
//  Created by feng on 2020/12/4.
//

#import "IACellConfig.h"

@implementation IACellConfig
+ (instancetype)configWithClass:(NSString *)cellClass isNib:(BOOL)isNib model:(id)model {
    IACellConfig *config = IACellConfig.new;
    config.cellClass = cellClass;
    config.isNib = isNib;
    config.model = model;
    return config;
}
+ (instancetype)nibConfigWithClass:(NSString *)cellClass model:(id)model {
    return [self configWithClass:cellClass isNib:YES model:model];
}
+ (instancetype)noNibConfigWithClass:(NSString *)cellClass model:(id)model {
    return [self configWithClass:cellClass isNib:NO model:model];
}
@end
