//
//  NSObject+Swizzle.h
//  LearnTestDemo
//
//  Created by du on 2018/9/17.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (void)swizzledMethodWithClass:(Class)swizzleClass originalSelector:(SEL)originSel newSelector:(SEL)newSel;

@end
