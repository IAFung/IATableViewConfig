//  IABaseTableViewCell.m
//
//  Created by fun on 2018/10/23.
//  Copyright © 2018年 fun. All rights reserved.
//

#import "IABaseTableViewCell.h"
@implementation IABaseTableViewCell {
    UIView *blankView;
    IABlankModel *_model;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews{

}


- (void)layoutSubviews {
    [super layoutSubviews];
    if (blankView) {
        blankView.frame = CGRectMake(_model.leftPadding, 0, self.bounds.size.width - _model.leftPadding - _model.rightPadding, self.bounds.size.height);
    }

}
- (void)setModel:(id)model{
    if ([model isKindOfClass:IABlankModel.class]) {
        IABlankModel *m = (IABlankModel *)model;
        _model = m;
        if (!blankView) {
            blankView = UIView.new;
            [self.contentView addSubview:blankView];
        }
        blankView.backgroundColor = [m color];
    }
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (CGFloat)cellHeightByConfig:(IACellConfig *)config {
    if ([config.model isKindOfClass:IABlankModel.class]) {
        return [(IABlankModel *)config.model height];
    }
    return 0.0;
}
- (BOOL)autoCalculateHeight{
    return NO;
}
- (BOOL)usingCache {
    return YES;
}
@end
