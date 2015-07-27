//
//  KYDopePopup.m
//  KYDopePopupDemo
//
//  Created by Kitten Yang on 7/27/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#define COLORWITHRGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define COLORWITHSAMEVALUE(v) [UIColor colorWithRed:v/255.0 green:v/255.0 blue:v/255.0 alpha:1.0]

#define TITLEHEIGHT     55
#define MESSAGEHEIGHT   90
#define BUTTONHEIGHT    50
#define MARGIN          15
#define MESSAGEMARGIN   15

#define FONT_TITLE    20.0f
#define FONT_MESSAGE  16.0f
#define FONT_BUTTON   16.0f


#import "KYDopePopup.h"
#import "UIImage+Color.h"


@interface KYDopePopup()

@property(nonatomic,strong)UILabel  *titleLabel;
@property(nonatomic,strong)UILabel  *messageLabel;
@property(nonatomic,strong)UIButton *cancelButton;
@property(nonatomic,strong)UIButton *otherButton;


@end

@implementation KYDopePopup{

    //阴影背景层
    UIView *dimmingView;
    
    KYDopePopupStyle type;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle{
    
    return [self initWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitle:otherButtonTitle style:KYDopePopupStyleDropDown];
}


- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle style:(KYDopePopupStyle)animationStyle{
    
    self = [super initWithFrame:CGRectMake(0, -TITLEHEIGHT-MESSAGEHEIGHT-BUTTONHEIGHT, [UIScreen mainScreen].bounds.size.width-MARGIN*2, TITLEHEIGHT+MESSAGEHEIGHT+BUTTONHEIGHT)];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        type = animationStyle;
        [self layoutCustomViews];
        
        self.titleLabel.text   = title;
        self.messageLabel.text = message;
        [self.cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
        [self.otherButton setTitle:otherButtonTitle forState:UIControlStateNormal];
        
        
    }
    
    return self;
}


-(void)layoutCustomViews{
    
    
    UIView* shadowView = [[UIView alloc] initWithFrame: self.bounds];
//    shadowView.backgroundColor =[UIColor yellowColor];
    shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    shadowView.layer.shadowRadius = 6.0f;
    shadowView.layer.shadowOffset = CGSizeMake(0.0, 4.0);
    shadowView.layer.shadowOpacity = 0.2;
    [self addSubview:shadowView];
    
    UIView *containerView = [[UIView alloc]initWithFrame:self.bounds];
    containerView.backgroundColor = COLORWITHSAMEVALUE(250);
    containerView.layer.cornerRadius  = 5.0f;
    containerView.layer.masksToBounds = YES;

    [shadowView addSubview:containerView];
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, TITLEHEIGHT)];
    self.titleLabel.backgroundColor = COLORWITHSAMEVALUE(242);
    self.titleLabel.font = [UIFont boldSystemFontOfSize:FONT_TITLE];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.minimumScaleFactor = 6.0/FONT_TITLE;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textColor = COLORWITHSAMEVALUE(55);
    
    
    self.messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(MESSAGEMARGIN, self.titleLabel.frame.size.height, self.frame.size.width-MESSAGEMARGIN*2, MESSAGEHEIGHT)];
    self.messageLabel.backgroundColor = COLORWITHSAMEVALUE(250);
    self.messageLabel.font = [UIFont boldSystemFontOfSize:FONT_MESSAGE];
    self.messageLabel.adjustsFontSizeToFitWidth = YES;
    self.messageLabel.minimumScaleFactor = 6.0/FONT_MESSAGE;
    self.messageLabel.numberOfLines = 0;
    self.messageLabel.textColor = COLORWITHSAMEVALUE(57);
    
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelButton.frame = CGRectMake(0, _titleLabel.frame.size.height + _messageLabel.frame.size.height, self.frame.size.width/2, BUTTONHEIGHT);
    [self.cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelButton setTitleColor:COLORWITHSAMEVALUE(55) forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:COLORWITHSAMEVALUE(255) forState:UIControlStateHighlighted];
    [self.cancelButton setTitleColor:COLORWITHSAMEVALUE(255) forState:UIControlStateHighlighted];
    [self.cancelButton setBackgroundImage:[UIImage imageWithGradientStartR0:93 G0:131 B0:216 A0:1.0 endR1:68 G1:109 B1:198 A1:1.0] forState:UIControlStateHighlighted];
    self.cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:FONT_BUTTON];
    self.cancelButton.backgroundColor = COLORWITHSAMEVALUE(238);
    
    
    self.otherButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.otherButton.frame = CGRectMake(self.frame.size.width/2, _titleLabel.frame.size.height + _messageLabel.frame.size.height, self.frame.size.width/2, BUTTONHEIGHT);
    [self.otherButton addTarget:self action:@selector(otherButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.otherButton setTitleColor:COLORWITHSAMEVALUE(55) forState:UIControlStateNormal];
    [self.otherButton setTitleColor:COLORWITHSAMEVALUE(255) forState:UIControlStateHighlighted];
    [self.otherButton setBackgroundImage:[UIImage imageWithGradientStartR0:93 G0:131 B0:216 A0:1.0 endR1:68 G1:109 B1:198 A1:1.0] forState:UIControlStateHighlighted];
    self.otherButton.titleLabel.font = [UIFont boldSystemFontOfSize:FONT_BUTTON];
    self.otherButton.backgroundColor = COLORWITHSAMEVALUE(238);
    
    
    [containerView addSubview:self.titleLabel];
    [containerView addSubview:self.messageLabel];
    [containerView addSubview:self.cancelButton];
    [containerView addSubview:self.otherButton];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, _titleLabel.frame.size.height, _titleLabel.frame.size.width, 1)];
    line1.backgroundColor = COLORWITHSAMEVALUE(220);
    [containerView addSubview:line1];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, _titleLabel.frame.size.height + _messageLabel.frame.size.height - 1, _titleLabel.frame.size.width, 1)];
    line2.backgroundColor = COLORWITHSAMEVALUE(220);
    [containerView addSubview:line2];
    
    UIView *line3 = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width/2-0.5, _titleLabel.frame.size.height + _messageLabel.frame.size.height, 1, _otherButton.frame.size.height)];
    line3.backgroundColor = COLORWITHSAMEVALUE(220);
    [containerView addSubview:line3];
    
}



-(void)show{
    
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];

    dimmingView = [[UIView alloc]initWithFrame:keyWindow.bounds];
    dimmingView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    [keyWindow addSubview:dimmingView];
    
    [keyWindow addSubview:self];
    
    dimmingView.alpha = 0.0f;
    [UIView animateWithDuration:0.3 animations:^{
        
        dimmingView.alpha = 1.0f;
        
    } completion:^(BOOL finished) {
        
    }];

    if (type == KYDopePopupStyleDropDown) {
        
        self.alpha = 0.0f;
        self.layer.transform = CATransform3DRotate(self.layer.transform, -M_PI/27.0, 0, 0, 1);
        
        [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.6f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.alpha = 1.0f;
            self.center = keyWindow.center;
            self.layer.transform = CATransform3DIdentity;
            
        } completion:NULL];
        
    }else{
        

    
    }
    

}

-(void)cancelButtonClicked:(UIButton *)sender{
    
    self.cancelButtonClickedBlock();
    [self dismiss];
    
}


-(void)otherButtonClicked:(UIButton *)sender{
    
    self.otherButtonClickedBlock();
    [self dismiss];
}



-(void)dismiss{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        dimmingView.alpha = 0.0f;
        self.alpha = 0.0f;
        self.center = CGPointMake(self.center.x, [UIScreen mainScreen].bounds.size.height + self.frame.size.height/2);
        self.layer.transform = CATransform3DRotate(self.layer.transform, M_PI_4/8.0, 0, 0, 1);
        
    } completion:^(BOOL finished) {

        [self removeViews];
        
    }];

}

-(void)removeViews{
    [dimmingView removeFromSuperview];
    [self removeFromSuperview];
    dimmingView = nil;
}



@end
