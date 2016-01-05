//
//  secondViewController.m
//  coreMotionDemo1
//
//  Created by yeeda on 16/1/4.
//  Copyright © 2016年 WB. All rights reserved.
//

#import "secondViewController.h"
#import "WBMotiomShareManager.h"
@interface secondViewController ()
{
    WBMotiomShareManager *_manager;
}
@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _manager = [WBMotiomShareManager motionShareManager];
    [_manager pullDeviceMotionWithTimer:0.02 resultHandlerBlock:^(CMDeviceMotion *motion) {
        
        if (motion.userAcceleration.x < -3) {
            NSLog(@"motion.userAcceleration.x = %0.2f motion.userAcceleration.y = %0.2f",motion.userAcceleration.x , motion.userAcceleration.y);
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_manager stop];
}
- (void)viewWillAppear:(BOOL)animated
{
    [_manager start];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
