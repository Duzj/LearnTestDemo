//
//  RunLoopTestViewController.m
//  Pods-LearnTestDemo_Example
//
//  Created by du on 2018/8/30.
//

#import "RunLoopTestViewController.h"

@interface RunLoopTestViewController ()

@end

@implementation RunLoopTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)testCFRunLoopRef{
    // CFRunLoopRef 线程安全的
    CFRunLoopRef runLoopRef = CFRunLoopGetCurrent();
    
}

- (void)testNSRunLoop{
    //runloop不能自己创建(alloc init),只能获取,通过:currentRunLoop;mainRunLoop,如果此时线程中没有runloop,在调用currentRunLoop 系统会帮你创建一个runloop 返回
    //线程和 RunLoop 之间是一一对应的，其关系是保存在一个全局的 Dictionary 里。线程刚创建时并没有 RunLoop，如果你不主动获取，那它一直都不会有。RunLoop 的创建是发生在第一次获取时，RunLoop 的销毁是发生在线程结束时。你只能在一个线程的内部获取其 RunLoop（主线程除外）。
//    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    NSRunLoop *runLoop = [NSRunLoop mainRunLoop];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
