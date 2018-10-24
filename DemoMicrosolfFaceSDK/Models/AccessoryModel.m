//
//  AccessoryModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/23/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "AccessoryModel.h"

@implementation AccessoryModel

+(id)initWithDictionary:(NSDictionary *)dict {
    AccessoryModel *model = [[AccessoryModel alloc] init];
    model.type = CHECK_NULL_RESULT([dict objectForKey:KEY_TYPE],@"");
    model.confidence = CHECK_NULL_RESULT([dict objectForKey:KEY_CONFIDENCE], [NSNumber numberWithFloat:0]);
    return model;
}

@end
