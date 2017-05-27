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

    
    UIView *view = UIView
        .createWithFrame(CGRectMake(50, 50, 100, 100))
        .addToView(self.view)
        .cornerRadius(10)
        .bgColor([UIColor blueColor]);
    
    NSLog(@"%@", view);

    
    view.x.y.equalTo(20).with.w.equalTo(50);
    NSLog(@"%@", view);

}


@end
