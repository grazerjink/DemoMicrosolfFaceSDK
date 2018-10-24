//
//  HairModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HairModel : BaseModel

@property (nonatomic,strong) NSNumber *bald;
@property (nonatomic,assign) BOOL *invisible;
@property (nonatomic,strong) NSMutableArray<ColorModel *> *hairColor;

@end

NS_ASSUME_NONNULL_END
