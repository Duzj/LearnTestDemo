//
//  NSObject+Swizzle.m
//  LearnTestDemo
//
//  Created by 杜志坚 on 2018/9/17.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>


@implementation NSObject (Swizzle)

//+ (void)load{
//    
//}

+ (void)swizzledMethodWithClass:(Class)swizzleClass originalSelector:(SEL)originSel newSelector:(SEL)newSel{
    
    Method originMethod = class_getClassMethod(swizzleClass, originSel);
    Method newMethod = class_getClassMethod(swizzleClass, newSel);
    //先尝试給源SEL添加IMP，这里是为了避免源SEL没有实现IMP的情况
    BOOL isAddMethod = class_addMethod(swizzleClass, originSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (isAddMethod) {
        //添加成功：说明源SEL没有实现IMP，将源SEL的IMP替换到交换SEL的IMP
        class_replaceMethod(swizzleClass, newSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else{
        //添加失败：说明源SEL已经有IMP，直接将两个SEL的IMP交换即可
        method_exchangeImplementations(originMethod, newMethod);
    }
}


@end
