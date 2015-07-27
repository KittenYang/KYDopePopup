//
//  UIImage+Color.m
//  KYDopePopupDemo
//
//  Created by Kitten Yang on 7/28/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


+(UIImage *)imageWithGradientStartR0:(CGFloat)r0 G0:(CGFloat)g0 B0:(CGFloat)b0 A0:(CGFloat)a0 endR1:(CGFloat)r1 G1:(CGFloat)g1 B1:(CGFloat)b1 A1:(CGFloat)a1{
    
    CGSize size = CGSizeMake(1.0f, 1.0f);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    size_t gradientNumberOfLocations = 2;
    CGFloat gradientLocations[2] = { 0.0, 1.0 };
    CGFloat gradientComponents[8] = { r0/255.0, g0/255.0, b0/255.0, a0,     // Start color
        r1/255.0, g1/255.0, b1/255.0, a1, };  // End color
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents (colorspace, gradientComponents, gradientLocations, gradientNumberOfLocations);
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return image;
}

@end
