//
//  FaceAttributeModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeadPoseModel.h"
#import "FacialHairModel.h"
#import "EmotionModel.h"
#import "LevelModel.h"
#import "MakeupModel.h"
#import "OcclusionModel.h"
#import "HairModel.h"
#import "AccessoryModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FaceAttributeModel : BaseModel

@property (nonatomic,strong) NSNumber *smile;
@property (nonatomic,strong) HeadPoseModel *headPose;
@property (nonatomic,strong) NSString *gender;
@property (nonatomic,strong) NSNumber *age;
@property (nonatomic,strong) FacialHairModel *facialHair;
@property (nonatomic,strong) NSString *glasses;
@property (nonatomic,strong) EmotionModel *emotion;
@property (nonatomic,strong) LevelModel *blur;
@property (nonatomic,strong) LevelModel *exposure;
@property (nonatomic,strong) LevelModel *noise;
@property (nonatomic,strong) MakeupModel *makeup;
@property (nonatomic,strong) NSMutableArray<AccessoryModel *> *accessories;
@property (nonatomic,strong) OcclusionModel *occlusion;
@property (nonatomic,strong) HairModel *hair;

@end

NS_ASSUME_NONNULL_END
