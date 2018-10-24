//
//  MakeupModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MakeupModel : BaseModel

@property (nonatomic,assign) BOOL *eyeMakeup;
@property (nonatomic,assign) BOOL *lipMakeup;

@end

NS_ASSUME_NONNULL_END
