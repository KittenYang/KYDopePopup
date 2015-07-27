//
//  ViewController.m
//  KYDopePopupDemo
//
//  Created by Kitten Yang on 7/26/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "ViewController.h"
#import "KYSpringLayerAnimation.h"

#import "KYDopePopup.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController{
    UIImageView*testView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)iNeedPopup:(id)sender {
    
    

    KYDopePopup *popup = [[KYDopePopup alloc]initWithTitle:@"检查更新"  message:@"检测到新版本(2.0 UTV版本)，是否下载新版本？" cancelButtonTitle:@"取消更新" otherButtonTitle:@"下载更新"];
    
    [popup show];
    
    popup.cancelButtonClickedBlock = ^(){
        NSLog(@"cancel");
    };
    
    
    popup.otherButtonClickedBlock = ^(){
        NSLog(@"other");        
    };
    
}



@end
