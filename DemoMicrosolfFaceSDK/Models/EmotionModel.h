//
//  EmotionModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EmotionModel : BaseModel

@property (nonatomic,assign) BOOL anger;
@property (nonatomic,assign) BOOL contempt;
@property (nonatomic,assign) BOOL disgust;
@property (nonatomic,assign) BOOL fear;
@property (nonatomic,assign) BOOL happiness;
@property (nonatomic,assign) BOOL neutral;
@property (nonatomic,assign) BOOL sadness;
@property (nonatomic,assign) BOOL surprise;

@end

NS_ASSUME_NONNULL_END
