//
//  FaceLandmarkModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "FaceLandmarkModel.h"

@implementation FaceLandmarkModel

+(id)initWithDictionary:(NSDictionary *)dict {
    FaceLandmarkModel *model = [[FaceLandmarkModel alloc]init];
    model.pupilLeft = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.pupilRight = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.noseTip = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.mouthLeft = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.mouthRight = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyebrowLeftOuter = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyebrowLeftInner = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyeLeftOuter = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyeLeftTop = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyeLeftBottom = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyeLeftInner = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyebrowRightInner = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyebrowRightOuter = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyeRightInner = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyeRightTop = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyeRightBottom = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.eyeRightOuter = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.noseRootLeft = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.noseRootRight = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.noseLeftAlarTop = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.noseRightAlarTop = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.noseLeftAlarOutTip = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.noseRightAlarOutTip = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.upperLipTop = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.upperLipBottom = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.underLipTop = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    model.underLipBottom = [model getPointInDict:[dict objectForKey:KEY_PUPI_LEFT]];
    return model;
}

- (CGPoint)getPointInDict:(NSDictionary *)dict {
    float x = [CHECK_NULL_RESULT([dict objectForKey:KEY_X], [NSNumber numberWithFloat:0]) floatValue];
    float y = [CHECK_NULL_RESULT([dict objectForKey:KEY_Y], [NSNumber numberWithFloat:0]) floatValue];
    return CGPointMake(x,y);
}

@end
