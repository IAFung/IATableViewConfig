//
//  M80FeedAvatarCell.m
//  M80TableViewComponent_Example
//
//  Created by amao on 2019/5/31.
//  Copyright © 2019 amao. All rights reserved.
//

#import "M80FeedAvatarCell.h"
#import "M80Feed.h"
#import "Masonry.h"
#import "NSObject+IATopViewController.h"
#import "IATableViewController.h"
#import "NSArray+IAAddition.h"
#import "IATableViewReloader.h"
@implementation M80FeedAvatarCell {
    IACellConfig *_config;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(onTap:)];
    [self.avatarImageView addGestureRecognizer:tap];
    [self.avatarImageView setUserInteractionEnabled:YES];
}

- (void)setModel:(M80Feed *)feed
{
    self.nameLabel.text = feed.username;
    self.infoLabel.text = feed.createAt;
    [self.avatarImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:feed.avatarURLString]]]];
}
//- (BOOL)autoCalculateHeight{
//    return NO;
//}

- (CGFloat)cellHeightByConfig:(IACellConfig *)config{
    if (config.changedHeight) {
        return 70;
    }
    return 50;
}
- (void)onTap:(id)sender
{
    _config.changedHeight = !_config.changedHeight;
    [IATableViewReloader reloadChangedHeightCell:_config];
}
- (void)setCellConfig:(IACellConfig *)config {
    _config = config;
}
- (BOOL)usingCache{
    return NO;
}
@end