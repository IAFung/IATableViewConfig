//  NSArray+IAAddition.h
//
//  Created by fun on 2020/3/6.
//  Copyright © 2020 . All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (IAAddition)
- (NSArray *)ia_map:(id (^)(id object))block;
- (NSArray *)ia_filter:(BOOL (^)(id object))block;
- (void)ia_each:(void (^)(id object))block;
- (void)ia_eachWithIndex:(void (^)(id object, NSUInteger index))block;
- (NSArray *)ia_intersectionWithArray:(NSArray *)array;
- (BOOL)ia_containsItemsFromArray:(NSArray *)array;
- (BOOL)ia_is2D;
@end

NS_ASSUME_NONNULL_END
