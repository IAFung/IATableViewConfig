//
//  StackTableViewCell.m
//  IATableView
//
//  Created by feng on 2020/12/7.
//

#import "StackTableViewCell.h"

@implementation StackTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
///返回高度三种方式:
///1. cellHeightByConfig
///2. autoCalculateHeight返回YES. 这种情况需要添加好约束,且高度要指定出来,
///3. autoCalculateHeight返回YES. 约束计算为0会走sizeThatFits方法

//- (CGFloat)cellHeightByConfig:(IACellConfig *)config {
//    return 110;
//}
- (BOOL)autoCalculateHeight {
    return YES;
}
- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width - 30, 110);
}

@end
