//
//  NSTimer+weak.m
//  LearnTestDemo
//
//  Created by 杜志坚 on 2018/9/13.
//

#import "NSTimer+weak.h"

@interface weakTimerObject : NSObject

@property (nonatomic ,weak) id target;

@property (nonatomic ,assign) SEL sel;

@property (nonatomic ,weak) NSTimer *timer;

@end


@implementation weakTimerObject

- (void)firetime{
    if (self.target) {
        [self.target performSelector:self.sel withObject:self.timer.userInfo afterDelay:0.0];
    }else{
        [self.timer invalidate];
    }
}


@end


@implementation NSTimer (weak)

+ (void)load{
    
}

+ (void)initialize{
    
}

//+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;

+ (NSTimer *)weakTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    
    weakTimerObject *weakTimer = [weakTimerObject new];
    weakTimer.target = aTarget;
    weakTimer.sel = aSelector;
    weakTimer.timer = [NSTimer timerWithTimeInterval:ti target:weakTimer selector:@selector(firetime) userInfo:userInfo repeats:yesOrNo];
    [[NSRunLoop mainRunLoop] addTimer:weakTimer.timer forMode:NSRunLoopCommonModes];
    return weakTimer.timer;
}

+ (NSTimer *)weakTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo completeBlock:(void (^)(NSTimer *timer))block{
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:ti target:self selector:@selector(timerFire:) userInfo:[block copy] repeats:yesOrNo];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    return timer;
}

+ (void)timerFire:(NSTimer *)timer{
    if ([timer userInfo]) {
        void (^block) (NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        if (block) {
            block(timer);
        }
    }
    
}


@end
