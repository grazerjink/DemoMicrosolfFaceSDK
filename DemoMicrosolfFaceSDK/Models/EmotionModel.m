//
//  EmotionModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "EmotionModel.h"

@implementation EmotionModel

+(id)initWithDictionary:(NSDictionary *)dict {
    
    EmotionModel *model = [[EmotionModel alloc]init];
    
    model.anger = [CHECK_NULL_RESULT([dict objectForKey:KEY_ANGER], [NSNumber numberWithBool:NO]) boolValue];
    model.contempt = [CHECK_NULL_RESULT([dict objectForKey:KEY_CONTEMPT], [NSNumber numberWithBool:NO])boolValue ];
    model.disgust = [CHECK_NULL_RESULT([dict objectForKey:KEY_DISGUST],[NSNumber numberWithBool:NO]) boolValue];
    model.fear = [CHECK_NULL_RESULT([dict objectForKey:KEY_FEAR],[NSNumber numberWithBool:NO]) boolValue];
    model.happiness = [CHECK_NULL_RESULT([dict objectForKey:KEY_HAPPINESS], [NSNumber numberWithBool:NO]) boolValue];
    model.neutral = [CHECK_NULL_RESULT([dict objectForKey:KEY_NEUTRAL], [NSNumber numberWithBool:NO]) boolValue];
    model.sadness = [CHECK_NULL_RESULT([dict objectForKey:KEY_SADNESS], [NSNumber numberWithBool:NO]) boolValue];
    model.surprise = [CHECK_NULL_RESULT([dict objectForKey:KEY_SURPRISE], [NSNumber numberWithBool:NO]) boolValue];
    
    return model;
}

@end
