//
//  UIView+UIView_BlockGesture.h
//

#import <UIKit/UIKit.h>
typedef void (^IAGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (IABlockGesture)
/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)ia_addTapActionWithBlock:(IAGestureActionBlock)block;
/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)ia_addLongPressActionWithBlock:(IAGestureActionBlock)block;
@end
