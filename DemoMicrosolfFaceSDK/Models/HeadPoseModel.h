//
//  HeadPoseModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadPoseModel : BaseModel

@property (nonatomic,strong) NSNumber *pitch;
@property (nonatomic,strong) NSNumber *roll;
@property (nonatomic,strong) NSNumber *yaw;

@end

NS_ASSUME_NONNULL_END
