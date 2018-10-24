//
//  HeadPoseModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "HeadPoseModel.h"

@implementation HeadPoseModel

+(id)initWithDictionary:(NSDictionary *)dict {
    
    HeadPoseModel *model = [[HeadPoseModel alloc]init];
    
    model.pitch = CHECK_NULL_RESULT([dict objectForKey:KEY_PITCH], [NSNumber numberWithFloat:0]);
    model.roll = CHECK_NULL_RESULT([dict objectForKey:KEY_ROLL], [NSNumber numberWithFloat:0]);
    model.yaw = CHECK_NULL_RESULT([dict objectForKey:KEY_YAW], [NSNumber numberWithFloat:0]);
    
    return model;
}

@end
