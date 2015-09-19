//
//  GradientProgressView.h
//  GradientProgressLineView
//
//  Created by lisong on 15/9/19.
//  Copyright © 2015年 rcplatform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientProgressView : UIView

+ (void)showProgressInView:(UIView *)view frame:(CGRect)frame startColor:(UIColor *)gradientStartColor endColor:(UIColor *)gradientEndColor;

+ (void)hideProgressForView:(UIView *)view;

+ (void)hideAllProgressForView:(UIView *)view;

@end
