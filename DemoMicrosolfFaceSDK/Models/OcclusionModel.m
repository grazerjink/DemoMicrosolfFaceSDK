//
//  OcclusionModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "OcclusionModel.h"

@implementation OcclusionModel

+ (id)initWithDictionary:(NSDictionary *)dict {
    OcclusionModel *model = [[OcclusionModel alloc]init];
    model.eyeOccluded = [CHECK_NULL_RESULT([dict objectForKey:KEY_EYE_OCCLUDED], [NSNumber numberWithBool:NO]) boolValue];
    model.mouthOccluded = [CHECK_NULL_RESULT([dict objectForKey:KEY_MOUTH_OCCLUDED], [NSNumber numberWithBool:NO]) boolValue];
    model.foreheadOccluded = [CHECK_NULL_RESULT([dict objectForKey:KEY_FOREHEAD_OCCLUDED], [NSNumber numberWithBool:NO]) boolValue];
    return model;
}
@end
