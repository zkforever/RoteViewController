//
//  ZZRoteViewController.h
//  RoteViewController
//
//  Created by zk on 14-8-26.
//  Copyright (c) 2014年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZRoteViewController : UIViewController{
    BOOL  _isLandspace;
}
@property(nonatomic,assign)BOOL isLandspace;

-(void)changeLanspace:(BOOL)ret;

@end
