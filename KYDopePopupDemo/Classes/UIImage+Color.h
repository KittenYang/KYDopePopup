//
//  UIImage+Color.h
//  KYDopePopupDemo
//
//  Created by Kitten Yang on 7/28/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;

+(UIImage *)imageWithGradientStartR0:(CGFloat)r0 G0:(CGFloat)g0 B0:(CGFloat)b0 A0:(CGFloat)a0 endR1:(CGFloat)r1 G1:(CGFloat)g1 B1:(CGFloat)b1 A1:(CGFloat)a1;

@end
