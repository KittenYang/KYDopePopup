//
//  PopupTransition.m
//  KYDopePopupDemo
//
//  Created by Kitten Yang on 7/26/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "PopupTransition.h"

@implementation PopupTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{

    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    fromView.userInteractionEnabled = NO;
    
    UIView *dimmingView = [[UIView alloc]initWithFrame:fromView.bounds];
    dimmingView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.8];
    dimmingView.alpha = 0.0;
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.bounds = CGRectMake(0, 0, CGRectGetWidth(transitionContext.containerView.bounds) - 20 -20,50 + 40 + 70);
    toView.center = CGPointMake(transitionContext.containerView.center.x, -transitionContext.containerView.center.y);
    
    [transitionContext.containerView addSubview:dimmingView];
    [transitionContext.containerView addSubview:toView];
    
//    CAAnimation
}

@end
