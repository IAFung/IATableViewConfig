//
//  M80FeedAvatarCell.h
//  M80TableViewComponent_Example
//
//  Created by amao on 2019/5/31.
//  Copyright © 2019 amao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IABaseTableViewCell.h"
@class M80Feed;

NS_ASSUME_NONNULL_BEGIN

@interface M80FeedAvatarCell : IABaseTableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *avatarheightConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@end

NS_ASSUME_NONNULL_END
