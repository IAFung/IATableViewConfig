//
//  M80FeedTextCell.m
//  M80TableViewComponent_Example
//
//  Created by amao on 2019/6/13.
//  Copyright © 2019 amao. All rights reserved.
//

#import "M80FeedTextCell.h"
#import "M80Feed.h"
#import "Masonry.h"
@interface M80FeedTextCell ()
@property (nonatomic,strong)    UILabel *contentLabel;
@property(nonatomic, strong) M80Feed *model;
@end

@implementation M80FeedTextCell

- (void)initSubviews {
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = [M80FeedTextCell cellFont];
    _contentLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0];
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.equalTo(@15);
        make.right.equalTo(@(-15));
    }];
}
- (void)layoutSubviews {
    [super layoutSubviews];
//    self.contentLabel.frame = CGRectMake(15, 0, self.frame.size.width - 30, self.frame.size.height);
}
- (void)setModel:(M80Feed *)model
{
    _model = model;
    _contentLabel.text = model.text;
}
- (BOOL)autoCalculateHeight{
    return YES;
}


+ (UIFont *)cellFont
{
    static UIFont *font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        font = [UIFont fontWithName:@"PingFangSC-Regular" size: 17];
    });
    return font;
}
@end
