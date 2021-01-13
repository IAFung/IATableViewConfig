//  UIViewController+iaTopViewController.m
//
//  Created by fun on 2018/11/7.
//  Copyright © 2018年 fun. All rights reserved.
//

#import "NSObject+IATopViewController.h"

@implementation NSObject (IATopViewController)
#pragma mark - 视图控制器处理 获取最上层vc ⬇️
- (UIViewController*)ia_topViewController
{
    UIWindow *window;
    for (UIWindow *_window in [UIApplication sharedApplication].windows) {
        if (_window.isKeyWindow) {
            window = _window;
        }
    }
    if (!window) {
        if (@available(iOS 13.0, *)) {
            UIWindowScene *scene;
            for (UIWindowScene *_scene in [UIApplication sharedApplication].connectedScenes) {
                if (_scene.activationState == UISceneActivationStateForegroundActive) {
                    scene = _scene;
                }
            }
            for (UIWindow *_window in scene.windows) {
                if (_window.isKeyWindow) {
                    window = _window;
                }
            }
        } else {
            return nil;
        }
    }
    return [self topViewControllerWithRootViewController:window.rootViewController];
}

- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

@end
