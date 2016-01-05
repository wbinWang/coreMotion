//
//  ViewController.m
//  coreMotionDemo1
//
//  Created by yeeda on 16/1/4.
//  Copyright © 2016年 WB. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "WBMotiomShareManager.h"
#import "secondViewController.h"
@interface ViewController ()
{
    CMMotionManager *_motionManager;
    
    WBMotiomShareManager *_WBManager;
}
@end

@implementation ViewController
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_WBManager stop];
}
- (void)viewWillAppear:(BOOL)animated
{
    [_WBManager pullDeviceMotionWithTimer:0.02 resultHandlerBlock:^(CMDeviceMotion *motion) {
        double gravityX = motion.gravity.x;
        double gravityY = motion.gravity.y;
        double rotation = atan2(gravityX, gravityY);
        NSLog(@"x == %0.2f y == %0.2f rotation == %0.2f",gravityX,gravityY,rotation);
        self.oneView.transform = CGAffineTransformMakeRotation(rotation - M_PI);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.oneView.center = self.view.center;
    _WBManager = [WBMotiomShareManager motionShareManager];


//    _motionManager = [[CMMotionManager alloc]init];
//    if ([_motionManager isDeviceMotionAvailable]) {
//        //加速器和陀螺仪的复合数据
//        //设置采样频率
//        [_motionManager setDeviceMotionUpdateInterval:1 / 50.0];
//        [_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
//            double gravityX = motion.gravity.x;
//            double gravityY = motion.gravity.y;
//            double gravityZ = motion.gravity.z;
//            double rotation = atan2(gravityX, gravityY);
//            
//            NSLog(@"x == %0.2f y == %0.2f rotation == %0.2f",gravityX,gravityY,rotation);
//            
//            self.oneView.transform = CGAffineTransformMakeRotation(rotation - M_PI);
//        }];
//    }
//    [self gravity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 重力值
- (void)gravity
{
    double gravityX = _motionManager.deviceMotion.gravity.x;
    double gravityY = _motionManager.deviceMotion.gravity.y;
    double gravityZ = _motionManager.deviceMotion.gravity.z;
    
    NSLog(@"x == %0.2f",gravityX);
    NSLog(@"y == %0.2f",gravityY);
    NSLog(@"z == %0.2f",gravityZ);
}


- (IBAction)nextCtr:(id)sender {
    secondViewController *second = [[secondViewController alloc]init];
    [self.navigationController pushViewController:second animated:YES];
}

+ (NSMutableArray *)animationValues:(id)fromValue toValue:(id)toValue usingSpringWithDamping:(CGFloat)damping initialSpringVelocity:(CGFloat)velocity duration:(CGFloat)duration{
    //60个关键帧
    NSInteger numOfPoints  = duration * 60;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:numOfPoints];
    for (NSInteger i = 0; i < numOfPoints; i++) {
        [values addObject:@(0.0)];
    }
    //差值
    CGFloat d_value = [toValue floatValue] - [fromValue floatValue];
    for (NSInteger point = 0; point < numOfPoints ; point ++) {
        
        CGFloat x = (CGFloat)point / (CGFloat)numOfPoints;
        CGFloat value = [toValue floatValue] - d_value * (pow(M_E, -damping * x) * cos(velocity * x));
        //1 y = 1-e^{-5x} * cos(30x)
        values[point] = @(value);
    }
    return values;
}
@end
