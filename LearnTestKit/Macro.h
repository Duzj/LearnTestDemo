//
//  Macro.h
//  LearnTestDemo
//
//  Created by du on 2018/8/31.
//

#ifndef Macro_h
#define Macro_h



//#ifdef DEBUG
//# define NSLog(fmt, ...) NSLog((@"\n[File:%s]\n" "[Function:%s]\n" "[Line:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
//#else
//# define NSLog(...);
//#endif


//weak strong 引用
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif




//获取尺寸
#define SCREEN_HEIGHT               ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WIDTH                ([UIScreen mainScreen].bounds.size.width)

//导航栏,状态栏高度
#define kStatusExtensionHeight ((fabs(CGRectGetHeight([UIScreen mainScreen].bounds) - 812.) >= 1.0) ? (0.) : (24.))
//#define kTabBarExtensionHeight ((fabs(CGRectGetHeight([UIScreen mainScreen].bounds) - 812.) >= 1.0) ? (0.) : (34.))
#define kNewNavigationHeight (64 + kStatusExtensionHeight)
#define kNewStatusBarHeight (20. + kStatusExtensionHeight)


#define IS_IPHONE_5_4 (SCREEN_HEIGHT == 568.0) || (SCREEN_HEIGHT == 480)
#define IS_IPHONE_5_OR_5S   SCREEN_HEIGHT == 568 ? YES:NO
#define IS_IPHONE_6P     SCREEN_WIDTH == 414 ? YES:NO
#define IS_IPHONE_6      SCREEN_WIDTH == 375 ? YES:NO
#define IS_IPHONE_4 (SCREEN_HEIGHT == 480)
#define IS_IPHONE_6_OR_LATER        [[UIScreen mainScreen] bounds].size.width >= 375 ? YES:NO
#define IS_IPHONE_X (SCREEN_WIDTH == 375) && (SCREEN_HEIGHT == 812)

#define TU_WIDTH(f) (SCREEN_HEIGHT/667*(f))
#define TU_HEIGHT(f) (SCREEN_WIDTH/375*(f))


#endif /* Macro_h */
