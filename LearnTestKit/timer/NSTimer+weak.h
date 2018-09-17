//
//  NSTimer+weak.h
//  LearnTestDemo
//
//  Created by 杜志坚 on 2018/9/13.
//

#import <Foundation/Foundation.h>

@interface NSTimer (weak)

+ (NSTimer *)weakTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;


+ (NSTimer *)weakTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo completeBlock:(void (^)(NSTimer *timer))block;

@end
