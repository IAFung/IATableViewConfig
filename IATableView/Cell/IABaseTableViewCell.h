//  IABaseTableViewCell.h
//
//  Created by fun on 2018/10/23.
//  Copyright © 2018年 fun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IATableViewConfig/IATableViewConfig.h>
@interface IABaseTableViewCell : UITableViewCell<IATableViewCellProtocol>
- (void)initSubviews;
@end

