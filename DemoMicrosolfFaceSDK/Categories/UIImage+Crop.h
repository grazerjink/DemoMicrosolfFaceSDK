//
//  UIImage+Crop.h
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/23/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Crop)

- (UIImage *)crop:(CGRect)rect;
- (UIImage *)drawLandmark:(CGRect)rect;
- (UIImage *)fixOrientation;

@end

NS_ASSUME_NONNULL_END
