//
//  FacialHairModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "FacialHairModel.h"

@implementation FacialHairModel

+(id)initWithDictionary:(NSDictionary *)dict {
    
    FacialHairModel *model = [[FacialHairModel alloc]init];
    
    model.moustache = [CHECK_NULL_RESULT([dict objectForKey:KEY_MOUSTACHE], [NSNumber numberWithBool:NO]) boolValue];
    model.beard = [CHECK_NULL_RESULT([dict objectForKey:KEY_BEARD], [NSNumber numberWithBool:NO]) boolValue];
    model.sideburns = [CHECK_NULL_RESULT([dict objectForKey:KEY_SIDE_BURNS], [NSNumber numberWithBool:NO]) boolValue];
    
    return model;
}

@end
