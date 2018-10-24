//
//  OcclusionModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OcclusionModel : BaseModel

@property (nonatomic,assign) BOOL foreheadOccluded;
@property (nonatomic,assign) BOOL eyeOccluded;
@property (nonatomic,assign) BOOL mouthOccluded;

@end

NS_ASSUME_NONNULL_END
