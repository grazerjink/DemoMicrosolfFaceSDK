//
//  FaceAttributeModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "FaceAttributeModel.h"

@implementation FaceAttributeModel

+(id)initWithDictionary:(NSDictionary *)dict {
    FaceAttributeModel *model = [[FaceAttributeModel alloc]init];
    
    model.smile = CHECK_NULL_RESULT([dict objectForKey:KEY_SMILE], [NSNumber numberWithInt:0]);
    model.headPose = [HeadPoseModel initWithDictionary:[dict objectForKey:KEY_HEAD_POSE]];
    model.gender = CHECK_NULL_RESULT([dict objectForKey:KEY_GENDER], @"");
    model.age = CHECK_NULL_RESULT([dict objectForKey:KEY_AGE], [NSNumber numberWithInt:0]);
    model.facialHair = [FacialHairModel initWithDictionary:[dict objectForKey:KEY_FACIAL_HAIR]];
    model.glasses = CHECK_NULL_RESULT([dict objectForKey:KEY_GLASSES], @"");
    model.emotion = [EmotionModel initWithDictionary:[dict objectForKey:KEY_EMOTION]];
    model.blur = [LevelModel initWithDictionary:[dict objectForKey:KEY_BLUR] andModelType:TYPE_BLUR];
    model.exposure = [LevelModel initWithDictionary:[dict objectForKey:KEY_BLUR] andModelType:TYPE_EXPOSURE];
    model.noise = [LevelModel initWithDictionary:[dict objectForKey:KEY_BLUR] andModelType:TYPE_NOISE];
    model.makeup = [MakeupModel initWithDictionary:[dict objectForKey:KEY_MAKE_UP]];
    model.accessories = [[NSMutableArray alloc]init];
    for(NSDictionary *accessDict in [dict objectForKey:KEY_ACCESSORIES]) {
        [model.accessories addObject:[AccessoryModel initWithDictionary:accessDict]];
    }
    model.occlusion = [OcclusionModel initWithDictionary:[dict objectForKey:KEY_OCCLUSION]];
    model.hair = [HairModel initWithDictionary:[dict objectForKey:KEY_HAIR]];
    return model;
}

@end
