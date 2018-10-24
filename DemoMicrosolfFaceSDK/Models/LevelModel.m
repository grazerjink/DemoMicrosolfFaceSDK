//
//  LevelModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "LevelModel.h"

@implementation LevelModel


+(LevelModel *)initWithDictionary:(NSDictionary *)dict andModelType:(int)type {
    LevelModel *model = [[LevelModel alloc]init];
    model.value = CHECK_NULL_RESULT([dict objectForKey:KEY_VALUE], [NSNumber numberWithFloat:0]);
    
    switch (type) {
        case TYPE_BLUR:
            model.levelDescription = CHECK_NULL_RESULT([dict objectForKey:KEY_BLUR_LEVEL],@"");
            break;
          
        case TYPE_NOISE:
            model.levelDescription = CHECK_NULL_RESULT([dict objectForKey:KEY_NOISE_LEVEL],@"");
            break;
            
        case TYPE_EXPOSURE:
            model.levelDescription = CHECK_NULL_RESULT([dict objectForKey:KEY_EXPOSURE_LEVEL],@"");
            break;
    }
    return model;
}

@end
