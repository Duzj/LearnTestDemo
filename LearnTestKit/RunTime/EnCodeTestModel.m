//
//  EnCodeTestModel.m
//  LearnTestDemo
//
//  Created by 杜志坚 on 2018/9/17.
//

//序列化宏定义
#define DUZJ_NSCodingRuntime_EncodeWithCoder(Class)\
unsigned int outCount = 0;\
Ivar *ivars = class_copyIvarList([Class class], &outCount);\
for (int i = 0; i < outCount; i++) {\
    Ivar ivar = ivars[i];\
    const char *ivarName =  ivar_getName(ivar);\
    NSString *key = [NSString stringWithUTF8String:ivarName];\
    [aCoder encodeObject:[self valueForKey:key] forKey:key];\
}\
free(ivars);\
\


#define DUZJ_NSCodingRuntime_InitWithCoder(Class)\
if (self = [super init]) {\
unsigned int outCount = 0;\
Ivar *ivars = class_copyIvarList([Class class], &outCount);\
for (int  i =0 ; i < outCount ; i++) {\
    Ivar ivar = ivars[i];\
    NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];\
    id value = [aDecoder decodeObjectForKey:key];\
    if (value) {\
        [self setValue:value forKey:key];\
    }\
}\
free(ivars);\
}\
return self;\
\

#import "EnCodeTestModel.h"
#import <objc/runtime.h>

@implementation EnCodeTestModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    //方式三
    DUZJ_NSCodingRuntime_InitWithCoder(EnCodeTestModel);
    
    //方式二
//    if (self = [super init]) {
//        unsigned int outCount = 0;
//        /*注意这里 传入 self 和EnCodeTestModel 的区别,如果传入的是self,没有别的类继承这个类,在序列化时是没有问题的,
//         如果有别的类继承, 在子类里面序列化父类的属性时会调用
//         [super initWithCoder:aDecoder];
//         这个时候 在子类里面调用super方法,其实是子类去调用父类的方法,
//         如果父类中这里传入的是self, 此时这个self 应该是子类的self 指针,导致父类的属性并不会被序列化,这个时候序列化后就会少了父类属性
//         */
//        //Ivar *ivars = class_copyIvarList([self class], &outCount);
//        Ivar *ivars = class_copyIvarList([EnCodeTestModel class], &outCount);
//        for (int  i =0 ; i < outCount ; i++) {
//            Ivar ivar = ivars[i];
//            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
//            id value = [aDecoder decodeObjectForKey:key];
//            if (value) {
//                [self setValue:value forKey:key];
//            }
//        }
//        free(ivars);
//    }
//    return self;
    
    
    //方式1.
//    if (self = [super init]) {
//        _name = [aDecoder decodeObjectForKey:@"name"];
//        _name1 = [aDecoder decodeObjectForKey:@"name1"];
//        _name2 = [aDecoder decodeObjectForKey:@"name2"];
//        _name3 = [aDecoder decodeObjectForKey:@"name3"];
//        _name4 = [aDecoder decodeObjectForKey:@"name4"];
//    }
//    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder{
    //方式三
    DUZJ_NSCodingRuntime_EncodeWithCoder(EnCodeTestModel);
    
    //方式二
//    unsigned int outCount = 0;
//    Ivar *ivars = class_copyIvarList([EnCodeTestModel class], &outCount);
//    for (int i = 0; i < outCount; i++) {
//        Ivar ivar = ivars[i];
//        const char *ivarName =  ivar_getName(ivar);
//        NSString *key = [NSString stringWithUTF8String:ivarName];
//        [aCoder encodeObject:[self valueForKey:key] forKey:key];
//    }
//    free(ivars);
    
    //方式1
//    [aCoder encodeObject:_name forKey:@"name"];
//    [aCoder encodeObject:_name1 forKey:@"name1"];
//    [aCoder encodeObject:_name2 forKey:@"name2"];
//    [aCoder encodeObject:_name3 forKey:@"name3"];
//    [aCoder encodeObject:_name4 forKey:@"name4"];

}

- (NSString *)description{
    return nil;
}

@end
