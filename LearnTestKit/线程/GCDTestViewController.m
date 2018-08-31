//
//  GCDTestViewController.m
//  LearnTestDemo
//
//  Created by 杜志坚 on 2018/8/31.
//

#import "GCDTestViewController.h"
#import "Macro.h"

@interface GCDTestViewController ()
{
    NSInteger _flag;
    
}
@end

@implementation GCDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self test1];
}

- (void)test1{
    @weakify(self)
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @strongify(self)
        for (int i =0; i < 10000 ; i++) {
            self ->_flag ++;
            NSLog(@"%ld +++++" ,(long)self->_flag);
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @strongify(self)
        for (int i =0; i < 10000 ; i++) {
            self->_flag --;
            NSLog(@"%ld -----" ,self->_flag);
        }
    });
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
