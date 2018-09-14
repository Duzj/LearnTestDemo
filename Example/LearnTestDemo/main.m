//
//  main.m
//  LearnTestDemo
//
//  Created by Duzj on 08/30/2018.
//  Copyright (c) 2018 Duzj. All rights reserved.
//

@import UIKit;
#import "ZJAppDelegate.h"

void testLog(int t){
    printf("%d\n",t);
}

void testFun( int n, void (*test)(int t)){
    test(n);
}


int main(int argc, char * argv[])
{
    testFun(10, testLog);
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([ZJAppDelegate class]));
    }
}
