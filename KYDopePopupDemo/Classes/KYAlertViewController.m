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
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    titleLabel.backgroundColor = [UIColor grayColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = self.popupTitle;
    [self.view addSubview:titleLabel];
    
    
    //左侧按钮
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame = CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width / 2, 40);
    [leftButton setTitle:self.leftTitle forState:UIControlStateNormal];
    leftButton.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:leftButton];
    
    
    //右侧按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height - 40, self.view.frame.size.width / 2, 40);
    [rightButton setTitle:self.rightTitle forState:UIControlStateNormal];
    rightButton.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:rightButton];
    
    
    
    //MessageLabel
    UILabel *messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, titleLabel.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - 50 - 40)];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.backgroundColor = [UIColor whiteColor];
    messageLabel.text = self.popupMessage;
    [self.view addSubview:messageLabel];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
