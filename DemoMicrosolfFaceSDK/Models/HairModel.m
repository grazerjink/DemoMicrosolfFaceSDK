//
//  HairModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "HairModel.h"

@implementation HairModel

+(id)initWithDictionary:(NSDictionary *)dict {
    HairModel *hair = [[HairModel alloc]init];
    hair.bald = CHECK_NULL_RESULT([dict objectForKey:KEY_BALD], [NSNumber numberWithFloat:0]);
    hair.invisible = [CHECK_NULL_RESULT([dict objectForKey:KEY_INVISIBLE], [NSNumber numberWithBool:YES]) boolValue];
    hair.hairColor = [[NSMutableArray alloc]init];
    for (NSDictionary *color in [dict objectForKey:KEY_HAIR_COLOR]) {
        ColorModel *colorModel = [ColorModel initWithDictionary:color];
        [hair.hairColor addObject:colorModel];
    }
    return hair;
}

@end
