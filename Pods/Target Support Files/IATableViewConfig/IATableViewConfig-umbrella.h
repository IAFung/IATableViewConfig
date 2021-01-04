#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "IABlankModel.h"
#import "IACellConfig.h"
#import "IACellManager.h"
#import "IATableViewCellProtocol.h"
#import "IATableViewConfig.h"
#import "IATableViewController.h"
#import "IATableViewReloader.h"
#import "NSObject+IATopViewController.h"

FOUNDATION_EXPORT double IATableViewConfigVersionNumber;
FOUNDATION_EXPORT const unsigned char IATableViewConfigVersionString[];

