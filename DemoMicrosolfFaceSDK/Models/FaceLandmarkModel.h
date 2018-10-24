//
//  FaceLandmarkModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FaceLandmarkModel : BaseModel

@property (nonatomic,assign) CGPoint pupilLeft;
@property (nonatomic,assign) CGPoint pupilRight;
@property (nonatomic,assign) CGPoint noseTip;
@property (nonatomic,assign) CGPoint mouthLeft;
@property (nonatomic,assign) CGPoint mouthRight;
@property (nonatomic,assign) CGPoint eyebrowLeftOuter;
@property (nonatomic,assign) CGPoint eyebrowLeftInner;
@property (nonatomic,assign) CGPoint eyeLeftOuter;
@property (nonatomic,assign) CGPoint eyeLeftTop;
@property (nonatomic,assign) CGPoint eyeLeftBottom;
@property (nonatomic,assign) CGPoint eyeLeftInner;
@property (nonatomic,assign) CGPoint eyebrowRightInner;
@property (nonatomic,assign) CGPoint eyebrowRightOuter;
@property (nonatomic,assign) CGPoint eyeRightInner;
@property (nonatomic,assign) CGPoint eyeRightTop;
@property (nonatomic,assign) CGPoint eyeRightBottom;
@property (nonatomic,assign) CGPoint eyeRightOuter;
@property (nonatomic,assign) CGPoint noseRootLeft;
@property (nonatomic,assign) CGPoint noseRootRight;
@property (nonatomic,assign) CGPoint noseLeftAlarTop;
@property (nonatomic,assign) CGPoint noseRightAlarTop;
@property (nonatomic,assign) CGPoint noseLeftAlarOutTip;
@property (nonatomic,assign) CGPoint noseRightAlarOutTip;
@property (nonatomic,assign) CGPoint upperLipTop;
@property (nonatomic,assign) CGPoint upperLipBottom;
@property (nonatomic,assign) CGPoint underLipTop;
@property (nonatomic,assign) CGPoint underLipBottom;

@end

NS_ASSUME_NONNULL_END
