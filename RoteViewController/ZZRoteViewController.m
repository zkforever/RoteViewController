//
//  ZZRoteViewController.m
//  RoteViewController
//
//  Created by zk on 14-8-26.
//  Copyright (c) 2014年 zk. All rights reserved.
//

#import "ZZRoteViewController.h"

@interface ZZRoteViewController ()

@end

@implementation ZZRoteViewController

@synthesize isLandspace = _isLandspace;

-(BOOL)prefersStatusBarHidden{
    if (_isLandspace) {
        return YES;
    }
    return NO;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)setStatusBarStatus{
    if (_isLandspace) {
        if([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0){
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            [self setNeedsStatusBarAppearanceUpdate];
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            [self setNeedsStatusBarAppearanceUpdate];
        }else{
            [[UIApplication sharedApplication] setStatusBarHidden:YES];
        }
        
    }else{
        if([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0){
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            [self setNeedsStatusBarAppearanceUpdate];
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            [self setNeedsStatusBarAppearanceUpdate];
        }else{
            [[UIApplication sharedApplication] setStatusBarHidden:YES];
        }
    }
}

-(void)changewithOrentation{
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
        _isLandspace = YES;
    }else{
        _isLandspace = NO;
    }
    [self setStatusBarStatus];
}

-(void)changeLanspace:(BOOL)ret{
    if (ret) {
        _isLandspace = YES;
    }else{
        _isLandspace = NO;
    }
    [self setStatusBarStatus];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self changewithOrentation];
        // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
