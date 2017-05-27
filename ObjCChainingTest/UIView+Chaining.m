//
//  UIView+Chaining.m
//  ObjCChainingTest
//
//  Created by 贺瑞 on 2017/5/27.
//  Copyright © 2017年 ifensi. All rights reserved.
//

#import "UIView+Chaining.h"
#import <objc/runtime.h>

typedef enum : NSUInteger {
    ExtEqualToNone = 0,
    ExtEqualToX = 1 << 0,
    ExtEqualToY = 1 << 1,
    ExtEqualToW = 1 << 2,
    ExtEqualToH = 1 << 3,
    
} ExtEqualToOption;

@interface UIView (PrivateFrameExtend)
@property (nonatomic, assign) ExtEqualToOption equalToOption;

@end

@implementation UIView (PrivateFrameExtend)

- (void)setEqualToOption:(ExtEqualToOption)equalToOption
{
    objc_setAssociatedObject(self, @selector(equalToOption), @(equalToOption), OBJC_ASSOCIATION_ASSIGN);
}
- (ExtEqualToOption)equalToOption
{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}
@end



@implementation UIView (Chaining)

+ (UIView *)create;
{
    return [[self alloc] init];
}
+ (UIView *(^)(CGRect))createWithFrame;
{
    return ^(CGRect frame){
        return [[UIView alloc] initWithFrame:frame];
    };
}
- (UIView *(^)(UIView *toView))addToView;
{
    return ^(UIView *toView){
        [toView addSubview:self];
        return self;
    };
}
- (UIView *(^)(UIColor *))bgColor;
{
    return ^(UIColor *bgColor){
        self.backgroundColor = bgColor;
        return self;
    };
}
- (UIView *(^)(CGFloat))cornerRadius;
{
    return ^(CGFloat cornerRadius){
        self.layer.cornerRadius = cornerRadius;
        self.clipsToBounds = cornerRadius;
        return self;
    };
}

- (UIView *)x
{
    self.equalToOption |= ExtEqualToX;
    return self;
}
- (UIView *)y
{
    self.equalToOption |= ExtEqualToY;
    return self;
}
- (UIView *)w
{
    self.equalToOption |= ExtEqualToW;
    return self;
}
- (UIView *)h
{
    self.equalToOption |= ExtEqualToH;
    return self;
}
- (UIView *)with
{
    return self;
}

- (UIView *(^)(CGFloat))equalTo;
{
    return ^(CGFloat val){
        
        CGRect frame = self.frame;
        
        if(self.equalToOption & ExtEqualToX){
            frame.origin.x = val;
        }
        if(self.equalToOption & ExtEqualToY){
            frame.origin.y = val;
        }
        if(self.equalToOption & ExtEqualToW){
            frame.size.width = val;
        }
        if(self.equalToOption & ExtEqualToH){
            frame.size.height = val;
        }
        
        self.frame = frame;
        self.equalToOption = ExtEqualToNone;
        
        return self;
    };
}



@end
