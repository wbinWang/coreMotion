//
//  WBMotiomShareManager.h
//  coreMotionDemo1
//
//  Created by yeeda on 16/1/4.
//  Copyright © 2016年 WB. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>

@interface WBMotiomShareManager : CMMotionManager

/**单例创建 CMMotionManager*/
+ (WBMotiomShareManager *)motionShareManager;

- (void)start;

- (void)stop;

/**调用 pull 方式 获取deviceMotion的值*/
- (void)pullDeviceMotionWithTimer:(double)timer resultHandlerBlock:(void(^)(CMDeviceMotion *))block;

@end
