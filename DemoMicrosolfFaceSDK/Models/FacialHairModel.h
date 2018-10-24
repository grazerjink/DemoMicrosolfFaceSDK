//
//  FacialHairModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FacialHairModel : BaseModel

@property (nonatomic,assign) BOOL moustache;
@property (nonatomic,assign) BOOL beard;
@property (nonatomic,assign) BOOL sideburns;

@end

NS_ASSUME_NONNULL_END
