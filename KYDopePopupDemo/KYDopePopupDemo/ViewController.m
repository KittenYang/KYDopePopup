//
//  ViewController.m
//  KYDopePopupDemo
//
//  Created by Kitten Yang on 7/26/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "ViewController.h"
#import "KYSpringLayerAnimation.h"
#import "PopupTransition.h"
#import "KYAlertViewController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController{
    UIImageView*testView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    testView = [[UIImageView alloc]init];
//    testView.backgroundColor = [UIColor redColor];
//    testView.bounds = CGRectMake(0, 0, 200, 200);
//    testView.image = [UIImage imageNamed:@"500px头像"];
//    testView.center = CGPointMake(self.view.center.x,-testView.bounds.size.height/2);
////    testView.center = self.view.center;
//    [self.view addSubview:testView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)iNeedPopup:(id)sender {
    
    /*
    self.view.backgroundColor = [UIColor whiteColor];
    CAKeyframeAnimation *anim1 = [[KYSpringLayerAnimation sharedAnimManager]createCustomTransformAnima:@"transform" duration:0.5f fromValue:@(0) toValue:@(1)];
    
    CAKeyframeAnimation *anim2 = [[KYSpringLayerAnimation sharedAnimManager]createHalfCurveAnima:@"position.y" duration:0.5f fromValue:@(testView.center.y) toValue:@(self.view.center.y)];
    
//    CAKeyframeAnimation *anim2 = [[KYSpringLayerAnimation sharedAnimManager]createSpringAnima:@"position.y" duration:2.0f usingSpringWithDamping:1.6f initialSpringVelocity:3.0f fromValue:@(testView.center.y) toValue:@(self.view.center.y)];
    
    [testView.layer addAnimation:anim1 forKey:@"transform"];
    [testView.layer addAnimation:anim2 forKey:@"position.y"];
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = 1.0 / - 1800.0;
    testView.superview.layer.sublayerTransform = perspective;

    
    [UIView animateWithDuration:0.5f animations:^{
        self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.7];
    }];
     */
    KYAlertViewController *alertVC = [[KYAlertViewController alloc]init];
    alertVC.transitioningDelegate = self;
    alertVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:alertVC animated:YES completion:nil];
    
}


- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    return [PopupTransition new];
    
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return nil;
}

@end
