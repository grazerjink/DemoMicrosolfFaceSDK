//
//  FaceModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FaceLandmarkModel.h"
#import "FaceAttributeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FaceModel : BaseModel

@property (nonatomic,strong) NSString *faceId;
@property (nonatomic,assign) CGRect faceRectangle;
@property (nonatomic,strong) FaceLandmarkModel *faceLandmarks;
@property (nonatomic,strong) FaceAttributeModel *faceAttributes;


@end

NS_ASSUME_NONNULL_END
