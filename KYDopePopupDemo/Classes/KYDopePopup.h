//
//  KYDopePopup.h
//  KYDopePopupDemo
//
//  Created by Kitten Yang on 7/27/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KYPopUpClickBlock) (void);

typedef enum : NSUInteger {
    KYDopePopupStyleDropDown,
} KYDopePopupStyle;


@interface KYDopePopup : UIView

//Default animation style
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle;


- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle style:(KYDopePopupStyle)animationStyle;


-(void)show;


@property(nonatomic,copy)KYPopUpClickBlock cancelButtonClickedBlock;
@property(nonatomic,copy)KYPopUpClickBlock otherButtonClickedBlock;


@end
