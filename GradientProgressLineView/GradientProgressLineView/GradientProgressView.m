//
//  GradientProgressView.m
//  GradientProgressLineView
//
//  Created by lisong on 15/9/19.
//  Copyright © 2015年 rcplatform. All rights reserved.
//

#import "GradientProgressView.h"

@interface GradientProgressView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation GradientProgressView

- (instancetype)initWithFrame:(CGRect)frame startColor:(UIColor *)gradientStartColor endColor:(UIColor *)gradientEndColor {
    if (self = [super initWithFrame:frame]) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        _gradientLayer.startPoint = CGPointMake(0, 0.5);
        _gradientLayer.endPoint = CGPointMake(1,0.5);
        _gradientLayer.colors = @[(id)[gradientEndColor CGColor],(id)[gradientStartColor CGColor]];
        [self.layer insertSublayer:_gradientLayer atIndex:0];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
        animation.fromValue = @(-(frame.size.width / 2));
        animation.toValue = @(frame.size.width * 3 / 2);
        animation.duration = 1.5f;
        animation.repeatCount = INFINITY;
        [_gradientLayer addAnimation:animation forKey:nil];
    }
    return self;
}

+ (void)showProgressInView:(UIView *)view frame:(CGRect)frame startColor:(UIColor *)gradientStartColor endColor:(UIColor *)gradientEndColor {
    GradientProgressView *GradientProgressview = [[GradientProgressView alloc] initWithFrame:frame startColor:gradientStartColor endColor:gradientEndColor];
    [view addSubview:GradientProgressview];
}

+(void)hideProgressForView:(UIView *)view {
    GradientProgressView *subView = [self progressViewForView:view];
    [subView removeFromSuperview];
}

+ (void)hideAllProgressForView:(UIView *)view {
    NSArray *progressViews = [self allProgressViewsForView:view];
    for (GradientProgressView *progressView in progressViews) {
        [progressView removeFromSuperview];
    }
}

+ (GradientProgressView *)progressViewForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (GradientProgressView *)subview;
        }
    }
    return nil;
}

+ (NSArray *)allProgressViewsForView:(UIView *)view {
    NSMutableArray *progressViews = [NSMutableArray array];
    for (UIView *aView in view.subviews) {
        if ([aView isKindOfClass:self]) {
            [progressViews addObject:aView];
        }
    }
    return [NSArray arrayWithArray:progressViews];
}



@end
