//
//  M80FeedToolbarViewCell.m
//  M80TableViewComponent_Example
//
//  Created by amao on 2019/6/13.
//  Copyright © 2019 amao. All rights reserved.
//

#import "M80FeedToolbarViewCell.h"
#import "M80Feed.h"
@implementation M80FeedToolbarViewCell

- (void)setModel:(M80Feed *)feed{
    
    [self.commentButton setTitle:[NSString stringWithFormat:@"%d",(int)feed.commentCount]
                        forState:UIControlStateNormal];
    [self.likeButton setTitle:[NSString stringWithFormat:@"%d",(int)feed.likeCount]
                     forState:UIControlStateNormal];
}
- (BOOL)autoCalculateHeight{
    return YES;
}

- (UINib *)cellNib
{
    return [UINib nibWithNibName:@"M80FeedToolbarViewCell"
                          bundle:NSBundle.mainBundle];
}


@end
