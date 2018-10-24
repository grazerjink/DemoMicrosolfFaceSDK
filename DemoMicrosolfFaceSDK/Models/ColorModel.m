//
//  ColorModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "ColorModel.h"

@implementation ColorModel

+ (id)initWithDictionary:(NSDictionary *)dict {
    ColorModel *model = [[ColorModel alloc] init];
    model.color = CHECK_NULL_RESULT([dict objectForKey:KEY_COLOR],@"");
    model.confidence = CHECK_NULL_RESULT([dict objectForKey:KEY_CONFIDENCE], [NSNumber numberWithFloat:0]);
    return model;
}
@end
