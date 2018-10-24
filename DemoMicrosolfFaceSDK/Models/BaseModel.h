//
//  BaseModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel<__covariant T> : NSObject

+ (T)initWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
