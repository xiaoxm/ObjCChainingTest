//
//  UIView+Chaining.h
//  ObjCChainingTest
//
//  Created by 贺瑞 on 2017/5/27.
//  Copyright © 2017年 ifensi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Chaining)

- (UIView *)x;
- (UIView *)y;
- (UIView *)w;
- (UIView *)h;
- (UIView *)with;

+ (UIView *)create;
+ (UIView *(^)(CGRect))createWithFrame;
- (UIView *(^)(UIView *))addToView;
- (UIView *(^)(UIColor *))bgColor;
- (UIView *(^)(CGFloat))cornerRadius;

- (UIView *(^)(CGFloat))equalTo;

@end
