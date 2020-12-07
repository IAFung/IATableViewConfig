//
//  IATableViewCellProtocol.h
//  IATableView
//
//  Created by feng on 2020/12/5.
//

#import <Foundation/Foundation.h>
#import "IACellConfig.h"
NS_ASSUME_NONNULL_BEGIN

@protocol IATableViewCellProtocol <NSObject>

- (void)setModel:(id)model;
- (CGFloat)cellHeightByConfig:(IACellConfig *)config;
- (BOOL)autoCalculateHeight;
@optional
///cell展开关闭时从此代理获取config,并在展开关闭事件时改变config.changedHeight属性
- (void)setCellConfig:(IACellConfig *)config;
//关闭高度缓存
- (BOOL)usingCache;
@end

NS_ASSUME_NONNULL_END
