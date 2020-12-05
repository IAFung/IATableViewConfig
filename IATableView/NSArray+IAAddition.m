//  NSArray+iaAddition.m
//
//  Created by fun on 2020/3/6.
//  Copyright © 2020 . All rights reserved.
//

#import "NSArray+IAAddition.h"

@implementation NSArray (IAAddition)
- (BOOL)ia_is2D {
    return self.count > 0 && [self.firstObject isKindOfClass:NSArray.class];
}
- (NSArray *)ia_map:(id (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id object in self) {
        [array addObject:block(object) ?: [NSNull null]];
    }
    
    return array;
}
- (NSArray *)ia_filter:(BOOL (^)(id object))block {
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }]];
}
- (void)ia_each:(void (^)(id object))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void)ia_eachWithIndex:(void (^)(id object, NSUInteger index))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}
- (NSArray *)ia_intersectionWithArray:(NSArray *)array {
    NSPredicate *intersectPredicate = [NSPredicate predicateWithFormat:@"SELF IN %@", array];
    return [self filteredArrayUsingPredicate:intersectPredicate];
}
- (BOOL)ia_containsItemsFromArray:(NSArray *)array {
    BOOL contains = [self ia_intersectionWithArray:array].count > 0;
    return contains;
}

@end
