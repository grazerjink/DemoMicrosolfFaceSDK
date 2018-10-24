//
//  ColorModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorModel : BaseModel

@property (nonatomic,strong) NSString *color;
@property (nonatomic,strong) NSNumber *confidence;

@end

NS_ASSUME_NONNULL_END
