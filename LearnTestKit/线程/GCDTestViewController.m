//
//  GCDTestViewController.m
//  LearnTestDemo
//
//  Created by 杜志坚 on 2018/8/31.
//

#import "GCDTestViewController.h"
//#import "Macro.h"
#import "RunLoopTestViewController.h"

@interface GCDTestViewController ()
{
    NSInteger _flag;
    
}

@property (nonatomic ,strong) NSTimer *myTimer;

@property (nonatomic ,strong) CADisplayLink *displayLink;

@end

@implementation GCDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self test1];
//    [self test3];
    
//    NSMutableString *str1 = @"aaaaa".mutableCopy;
//    void (^testBlock) (void) = ^(void){
//        NSLog(@"%@",str1);
//    };
//    [str1 appendFormat:@"b"];
//    testBlock();
    
    
//    NSTimer
    [self blockTest];
    
//        NSProxy
    
}

- (void)blockTest{
    
    
    
    __block int i = 0;
    NSLog(@"block before地址: %p  : %d",&i,i);
    void (^testBlock)(void) = ^(void){

        NSLog(@"block in地址: %p  :%d  ",&i,i);
    };
    
    i  += 1;
    NSLog(@"block after地址: %p  :%d",&i,i);

    testBlock();
    
    [self test2];
    
    
    [self test4];
}


//- (void)test1{
//    @weakify(self)
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        @strongify(self)
//        for (int i =0; i < 10000 ; i++) {
//            self ->_flag ++;
//            NSLog(@"%ld +++++" ,(long)self->_flag);
//        }
//    });
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        @strongify(self)
//        for (int i =0; i < 10000 ; i++) {
//            self->_flag --;
//            NSLog(@"%ld -----" ,self->_flag);
//        }
//    });
//}

- (void)test2{
    [self performSelector:@selector(performSel) withObject:nil afterDelay:10];
}

- (void)performSel{
    NSLog(@"时间到了 ,执行了哈");
}


//- (void)test3{
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    const void * key = "key";
//    void *context = "main";
//    dispatch_queue_set_specific(mainQueue, key, context, NULL);
//
//    dispatch_block_t log = ^{
//        NSLog(@"current thread is main : %d",[NSThread isMainThread]);
//
//        void *value = dispatch_queue_get_specific(mainQueue, key);
//
//        NSLog(@"main queue : %d", value != NULL);
//
//    };
//
//
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    dispatch_async(globalQueue, ^{
//        dispatch_async(dispatch_get_main_queue(), log);
//    });
//
//    NSLog(@"before dispatch_main");
////    dispatch_main();
//
//    NSLog(@"after dispatch_main");
//
//
//    //主线程不一定在主队列中执行,
//    //所以通过dispatch_sync()执行的block不会开辟新的线程，而是在当前的线程（即主线程）中同步执行block
//    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        NSLog(@" -- current thread is main : %d",[NSThread isMainThread]);
//    });
//
////    NSOperation;
//
//
//}
static int i = 0;
- (void)test4{
    
    NSLog(@"%d",i++);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        [self test4];
    });
}

- (void)dealloc{
    NSLog(@"dealloc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
