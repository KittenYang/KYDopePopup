//
//  KYAlertViewController.h
//  KYDopePopupDemo
//
//  Created by Kitten Yang on 7/26/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KYAlertViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *MessageLabel;
@property (weak, nonatomic) IBOutlet UIButton *LeftButton;
@property (weak, nonatomic) IBOutlet UIButton *RightButton;

@property(nonatomic,strong)NSString *popupTitle;

@property(nonatomic,strong)NSString *popupMessage;

@property(nonatomic,strong)NSString *leftTitle;

@property(nonatomic,strong)NSString *rightTitle;

@end
