//
//  NSObject+Associated.m
//  LearnTestDemo
//
//  Created by 杜志坚 on 2018/9/14.
//

#import "NSObject+Associated.h"
#import <objc/runtime.h>

@implementation NSObject (Associated)

- (void)setAssociate:(NSString *)associate{
    /**
     * Sets an associated value for a given object using a given key and association policy.
     *
     * @param object The source object for the association.
     * @param key The key for the association.
     * @param value The value to associate with the key key for object. Pass nil to clear an existing association.
     * @param policy The policy for the association. For possible values, see “Associative Object Behaviors.”
     *
     * @see objc_setAssociatedObject
     * @see objc_removeAssociatedObjects
     */
    /*
     id object ：关联的源对象
     const void *key：关联的key
     id value：关联对象，通过将此个值置成nil来清除关联。
     objc_AssociationPolicy policy：关联的策略
     */
    objc_setAssociatedObject(self, @selector(associate), associate, OBJC_ASSOCIATION_RETAIN);
}

- (void)removeAssociate{
    objc_setAssociatedObject(self, @selector(associate), nil, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)associate{
    //_cmd
    
    return objc_getAssociatedObject(self, _cmd);
}

@end
