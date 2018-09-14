//
//  ZJMainTableViewController.m
//  LearnTestDemo_Example
//
//  Created by 杜志坚 on 2018/8/30.
//  Copyright © 2018年 Duzj. All rights reserved.
//

#import "ZJMainTableViewController.h"
#import <malloc/malloc.h>
#import <objc/runtime.h>
#import "NSTimer+weak.h"

static NSString *const KCellIdentifier = @"KCellIdentifier";

@interface ZJMainTableViewController ()

@property (nonatomic ,strong) NSMutableArray *dataSource;

@end

@implementation ZJMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"testDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"DataSourceList" ofType:@"plist"];
    
    self.dataSource = [NSMutableArray arrayWithContentsOfFile:sourcePath];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:KCellIdentifier];
    [self.tableView setTableFooterView:[UIView new]];
    [self.tableView reloadData];
    NSLog(@"%@",self.dataSource);
    
    UIView *view = [[UIView alloc]init];
//    view.frame = CGRectMake(0, 0, 300, 300);
//    view.bounds = CGRectMake(0, 0, 50, 50);
//    view.center = CGPointMake(100, 150);
//    view.center = self.view.center;
 

    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    NSObject *obj = [NSObject new];
    NSLog(@"Size of %@: %zd , %ld", NSStringFromClass([obj class]), malloc_size((__bridge const void *) obj),class_getInstanceSize([obj class]));
    
    UIImageView *imagevie = [[UIImageView alloc]init];
    
    [imagevie performSelector:@selector(setImage:) withObject:[UIImage new] afterDelay:0 inModes:@[NSDefaultRunLoopMode]];
//    method_setImplementation(<#Method  _Nonnull m#>, <#IMP  _Nonnull imp#>)
    
    
    __weak NSString *stre = @"dsdfas";
    
    NSLog(@"%@",stre);
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KCellIdentifier forIndexPath:indexPath];
    NSDictionary *currentDict = self.dataSource[indexPath.row];
    cell.textLabel.text = currentDict[@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *currentDict = self.dataSource[indexPath.row];
    
    Class class = NSClassFromString(currentDict[@"controller"]);
    
    UIViewController *vc = [[class alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - getter/setter

//- (NSMutableArray *)dataSource{
//    if (!_dataSource) {
//        _dataSource = [NSMutableArray arrayWithCapacity:0];
//
//    }
//    return _dataSource;
//}

@end
