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
- (void)setCellConfig:(IACellConfig *)config;
- (BOOL)usingCache;
@end

NS_ASSUME_NONNULL_END
