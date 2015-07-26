//
//  PopupTransition.m
//  KYDopePopupDemo
//
//  Created by Kitten Yang on 7/26/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "PopupTransition.h"
#import "KYSpringLayerAnimation.h"
#import "KYAlertViewController.h"

@implementation PopupTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromVC.view;
    [fromView layoutIfNeeded];
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    fromView.userInteractionEnabled = NO;
    
    NSLog(@"frame:%@",NSStringFromCGRect(fromView.frame));
    
    UIView *dimmingView = [[UIView alloc]initWithFrame:fromView.bounds];
    dimmingView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
    dimmingView.alpha = 0.0;
    
    KYAlertViewController *toVC = (KYAlertViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;
    NSLog(@"toView:%@",toView);
    [toView layoutIfNeeded];
    toView.frame = CGRectMake(0, 0, 320 -40,160);
    toView.center = CGPointMake(fromView.center.x, -fromView.center.y);
    toVC.LeftButton.userInteractionEnabled = YES;
    
    [transitionContext.containerView addSubview:dimmingView];
    [transitionContext.containerView addSubview:toView];
    
//   Animations
    
    CAKeyframeAnimation *anim1 = [[KYSpringLayerAnimation sharedAnimManager]createCustomTransformAnima:@"transform" duration:[self transitionDuration:transitionContext] fromValue:@(0) toValue:@(1)];
    
//    CAKeyframeAnimation *anim2 = [[KYSpringLayerAnimation sharedAnimManager]createHalfCurveAnima:@"position.y" duration:[self transitionDuration:transitionContext] fromValue:@(toView.center.y) toValue:@(fromView.center.y)];
    CAKeyframeAnimation *anim2 = [[KYSpringLayerAnimation sharedAnimManager]createSpringAnima:@"position.y" duration:2.0f usingSpringWithDamping:1.6f initialSpringVelocity:3.0f fromValue:@(toView.center.y) toValue:@(transitionContext.containerView.center.y)];
    
    [toView.layer addAnimation:anim1 forKey:@"transform"];
    [toView.layer addAnimation:anim2 forKey:@"position.y"];
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = 1.0 / - 1800.0;
    toView.superview.layer.sublayerTransform = perspective;
    
    
    [UIView animateWithDuration:0.5f animations:^{
        dimmingView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    

}

@end
