//
//  ViewController.m
//  RoteViewController
//
//  Created by zk on 14-8-26.
//  Copyright (c) 2014年 zk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(rotation:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"aa" forState:UIControlStateNormal];
    [self.view addSubview:btn];
	// Do any additional setup after loading the view, typically from a nib.
}

-(CGAffineTransform)getCATransform:(UIInterfaceOrientation)orientation{
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        return CGAffineTransformMakeRotation(M_PI*1.5);
    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
        return CGAffineTransformMakeRotation(M_PI/2);
    } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        return CGAffineTransformMakeRotation(-M_PI);
    } else {
        return CGAffineTransformIdentity;
    }
}

-(void)rotation:(id)sender{
    UIButton *btn = (UIButton*)sender;
    if ([btn.titleLabel.text isEqualToString:@"aa"]) {
        [btn setTitle:@"bb" forState:UIControlStateNormal];
        CGRect frame = self.view.frame;
        CGPoint center = CGPointMake(frame.origin.x + ceil(frame.size.width/2), frame.origin.y + ceil(frame.size.height/2));
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft animated:YES];
        [self changeLanspace:YES];
        
        CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;//（获取当前电池条动画改变的时间）
        [UIView beginAnimations:nil context:nil];
        CGAffineTransform ca = [self getCATransform:UIInterfaceOrientationLandscapeLeft];
        self.view.transform = ca;
        self.view.frame = frame;
        self.view.center = center;
        
        [UIView setAnimationDuration:duration];
        [UIView commitAnimations];
    }else{
        [btn setTitle:@"aa" forState:UIControlStateNormal];

        CGRect frame = [UIScreen mainScreen].applicationFrame;
        CGPoint center = CGPointMake(frame.origin.x + ceil(frame.size.width/2), frame.origin.y + ceil(frame.size.height/2));
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:YES];
        [self changeLanspace:NO];
        CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;//（获取当前电池条动画改变的时间）
        [UIView beginAnimations:nil context:nil];
        CGAffineTransform ca = [self getCATransform:UIInterfaceOrientationPortrait];
        self.view.transform = ca;
        self.view.frame = frame;
        self.view.center = center;
        
        [UIView setAnimationDuration:duration];
        [UIView commitAnimations];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
