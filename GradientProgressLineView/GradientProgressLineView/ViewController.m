//
//  ViewController.m
//  GradientProgressLineView
//
//  Created by lisong on 15/9/19.
//  Copyright © 2015年 rcplatform. All rights reserved.
//

#import "ViewController.h"
#import "GradientProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)showOne:(id)sender {
    
    [GradientProgressView showProgressInView:self.view
                                       frame:CGRectMake(0, 20, self.view.frame.size.width, 2)
                                  startColor:[UIColor redColor]
                                    endColor:[UIColor greenColor]];
}

- (IBAction)hideOne:(id)sender {
    [GradientProgressView hideProgressForView:self.view];
}


@end
