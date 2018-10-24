//
//  FaceModel.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "FaceModel.h"

@implementation FaceModel

+(id)initWithDictionary:(NSDictionary *)dict {
    FaceModel *model = [[FaceModel alloc]init];
    
    model.faceId = CHECK_NULL_RESULT([dict objectForKey:KEY_FACE_ID], @"");
    model.faceLandmarks = [FaceLandmarkModel initWithDictionary:[dict objectForKey:KEY_FACE_LANDMARKS]];
    model.faceAttributes = [FaceAttributeModel initWithDictionary:[dict objectForKey:KEY_FACE_ATTRIBUTES]];
    
    int top = [CHECK_NULL_RESULT([[dict objectForKey:KEY_FACE_RECTANGLE] objectForKey:KEY_TOP], [NSNumber numberWithInt:0]) intValue];
    int left = [CHECK_NULL_RESULT([[dict objectForKey:KEY_FACE_RECTANGLE] objectForKey:KEY_LEFT], [NSNumber numberWithInt:0]) intValue];
    int height = [CHECK_NULL_RESULT([[dict objectForKey:KEY_FACE_RECTANGLE] objectForKey:KEY_HEIGHT], [NSNumber numberWithInt:0]) intValue];
    int width = [CHECK_NULL_RESULT([[dict objectForKey:KEY_FACE_RECTANGLE] objectForKey:KEY_WIDTH], [NSNumber numberWithInt:0]) intValue];
    
    model.faceRectangle = CGRectMake(left, top, width, height);
    
    return model;
}
                        


@end
