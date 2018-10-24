//
//  LevelModel.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/22/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LevelModel : BaseModel

@property (nonatomic,strong) NSString *levelDescription;
@property (nonatomic,strong) NSNumber *value;

+(LevelModel *)initWithDictionary:(NSDictionary *)dict andModelType:(int)type;

@end

NS_ASSUME_NONNULL_END
