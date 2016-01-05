//
//  WBMotiomShareManager.m
//  coreMotionDemo1
//
//  Created by yeeda on 16/1/4.
//  Copyright © 2016年 WB. All rights reserved.
//

#import "WBMotiomShareManager.h"
//设备刷新频率
static NSTimeInterval deviceUpdateInterval = 0.01;
@interface WBMotiomShareManager ()
{
    NSTimer *_timer;
}
/**返回 device motion 数值*/
@property (nonatomic , copy)void(^WBMotionHandleBlock)(CMDeviceMotion *);

@end

@implementation WBMotiomShareManager

+ (WBMotiomShareManager *)motionShareManager
{
    static dispatch_once_t once_motion;
    static WBMotiomShareManager *_motionManager;
    
    dispatch_once(&once_motion, ^{
        _motionManager = [[WBMotiomShareManager alloc]init];
    });
    
    return _motionManager;
}
- (void)start
{
    [self startDeviceMotionUpdates];
}
- (void)stop
{
    [self stopDeviceMotionUpdates];
}
- (void)pullDeviceMotionWithTimer:(double)timer resultHandlerBlock:(void(^)(CMDeviceMotion *))block
{
    
    if (self.deviceMotionAvailable == YES) {
        
        self.WBMotionHandleBlock = block;
        
        self.deviceMotionUpdateInterval = deviceUpdateInterval;
        [self startDeviceMotionUpdates];
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:timer target:self selector:@selector(deviceMotionChange) userInfo:nil repeats:YES];
    }else {
        NSLog(@"设备不可用");
    }
}

#pragma mark - 获取设备移动数值改变量
- (void)deviceMotionChange
{
    self.WBMotionHandleBlock([self deviceMotion]);
}

@end
