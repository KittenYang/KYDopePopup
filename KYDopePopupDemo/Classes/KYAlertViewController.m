//
//  KYAlertViewController.m
//  KYDopePopupDemo
//
//  Created by Kitten Yang on 7/26/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "KYAlertViewController.h"

@interface KYAlertViewController ()

@end

@implementation KYAlertViewController


-(id)init{
    
    self = [super init];
    if (self) {
        
//        self.view = [[[NSBundle mainBundle]loadNibNamed:@"KYAlertView" owner:self options:nil] firstObject];
        self = [[[NSBundle mainBundle]loadNibNamed:@"KYAlertViewController" owner:self options:nil] firstObject];
        
        [self defaultValues];
        
    }
    return self;
}

-(void)defaultValues{
    
    self.popupTitle   = @"Title";
    self.popupMessage = @"Message.....";
    self.leftTitle = @"取消";
    self.rightTitle = @"确定";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.layer.cornerRadius = 10.0f;
    self.view.layer.masksToBounds = YES;
    
    //标题
    _TitleLabel.text = self.popupTitle;
    _MessageLabel.text =self.popupMessage;
    [_LeftButton setTitle:self.leftTitle forState:UIControlStateNormal];
    [_RightButton setTitle:self.rightTitle forState:UIControlStateNormal];
    
}

- (IBAction)leftButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)rightButtonClicked:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
