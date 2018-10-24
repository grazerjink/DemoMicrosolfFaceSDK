//
//  DetectFaceViewController.h
//  DemoMircosoftFaceAPI
//
//  Created by Winson Mac on 10/19/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetectFaceViewController : UIViewController
<
    UINavigationControllerDelegate,
    UIImagePickerControllerDelegate
>

@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIVisualEffectView *blurView;

@end

NS_ASSUME_NONNULL_END
