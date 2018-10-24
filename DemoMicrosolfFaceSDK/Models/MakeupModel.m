//
//  MakeupModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "MakeupModel.h"

@implementation MakeupModel

+ (id)initWithDictionary:(NSDictionary *)dict {
    MakeupModel *model = [[MakeupModel alloc]init];

    model.lipMakeup = [CHECK_NULL_RESULT([dict objectForKey:KEY_LIP_MAKE_UP], [NSNumber numberWithBool:NO]) boolValue];
    model.eyeMakeup = [CHECK_NULL_RESULT([dict objectForKey:KEY_EYE_MAKE_UP], [NSNumber numberWithBool:NO]) boolValue];
    
    return model;
}
@end
