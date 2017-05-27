//
//  ViewController.m
//  ObjCChainingTest
//
//  Created by 贺瑞 on 2017/5/27.
//  Copyright © 2017年 ifensi. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Chaining.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIView *view = [UIView new];
    
    view.x.y.equalTo(5).with.w.h.equalTo(50);
    NSLog(@"%@", NSStringFromCGRect(view.frame));
    
    
}


@end
