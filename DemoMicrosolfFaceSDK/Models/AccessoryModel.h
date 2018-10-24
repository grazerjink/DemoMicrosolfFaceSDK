//
//  AccessoryModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/23/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AccessoryModel : BaseModel

@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSNumber *confidence;

@end

NS_ASSUME_NONNULL_END
