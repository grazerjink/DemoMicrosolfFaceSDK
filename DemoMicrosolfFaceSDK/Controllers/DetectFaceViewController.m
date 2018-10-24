//
//  DetectFaceViewController.m
//  DemoMircosoftFaceAPI
//
//  Created by Winson Mac on 10/19/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "DetectFaceViewController.h"

@interface DetectFaceViewController ()

@end

@implementation DetectFaceViewController


#pragma mark - Properties

/* ---------------------------------------------------------------- */
/*  First init containerView propperty                              */
/* ---------------------------------------------------------------- */
- (UIView *)containerView {
    if(!_containerView) {
        _containerView = [[UIView alloc]initWithFrame:CGRectMake(0, TOOLBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - TOOLBAR_HEIGHT)];
        [_containerView setBackgroundColor:[UIColor blackColor]];
        [_containerView addSubview:self.imageView];
        [_containerView addSubview:self.blurView];
    }
    return _containerView;
}


/* ---------------------------------------------------------------- */
/*  First init imageView propperty                                  */
/* ---------------------------------------------------------------- */
- (UIImageView *)imageView {
    if(!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:
                      CGRectMake(0,
                                 0,
                                 self.containerView.width,
                                 self.containerView.height-BLUR_VIEW_DEFAULT_HEIGHT)];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onGetImageClicked:)];
        [_imageView addGestureRecognizer:tapGesture];
        [_imageView setUserInteractionEnabled:YES];
        [_imageView setImage:[UIImage imageNamed:@"placeholder.jpg"]];
        [_imageView setContentMode:UIViewContentModeScaleAspectFill];
    }
    return _imageView;
}


/* ---------------------------------------------------------------- */
/*  First init blurView propperty                                   */
/* ---------------------------------------------------------------- */
- (UIVisualEffectView *)blurView {
    if(!_blurView) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _blurView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _blurView.frame = CGRectMake(0,
                                     self.containerView.height- BLUR_VIEW_DEFAULT_HEIGHT,
                                     self.containerView.width,
                                     BLUR_VIEW_DEFAULT_HEIGHT);
        
        // Vibrancy effect
        UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
        UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
        vibrancyEffectView.frame = _blurView.bounds;
        [_blurView.contentView addSubview:vibrancyEffectView];
        [_blurView.contentView addSubview:self.scrollView];
    }
    return _blurView;
}


/* ---------------------------------------------------------------- */
/*  First init scrollView propperty                                 */
/* ---------------------------------------------------------------- */
- (UIScrollView *)scrollView {
    if(!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(MARGIN,
                                                                     MARGIN,
                                                                     self.blurView.contentView.width-MARGIN*2,
                                                                     BLUR_VIEW_DEFAULT_HEIGHT - MARGIN*2)];
        [_scrollView setBackgroundColor:[UIColor clearColor]];
    }
    return _scrollView;
}


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

- (void)setUpView {
    [self setTitle:@"Detect Face"];
    [self.view addSubview:self.containerView];
}

#pragma mark - Methods

/* ---------------------------------------------------------------- */
/*  Handle on image view clicked event                              */
/* ---------------------------------------------------------------- */
- (void)onGetImageClicked:(UITapGestureRecognizer *)gesture {
    
    UIAlertController *bottomSheetAlert = [UIAlertController alertControllerWithTitle:@"Which do you prefer to get an image?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionPick = [UIAlertAction actionWithTitle:@"Pick image from gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self pickImage];
    }];
    
    UIAlertAction *actionCapture = [UIAlertAction actionWithTitle:@"Capture a new image" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self captureImage];
    }];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    [bottomSheetAlert addAction:actionPick];
    [bottomSheetAlert addAction:actionCapture];
    [bottomSheetAlert addAction:actionCancel];
    [self presentViewController:bottomSheetAlert animated:TRUE completion:nil];
}


/* ---------------------------------------------------------------- */
/*  Navigate to picker controller to pick an image                  */
/* ---------------------------------------------------------------- */
- (void)pickImage {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
}


/* ---------------------------------------------------------------- */
/*  Navigate to picker controller to capture a new image            */
/* ---------------------------------------------------------------- */
- (void)captureImage {
    UIImagePickerController *captureController = [[UIImagePickerController alloc]init];
    captureController.sourceType = UIImagePickerControllerSourceTypeCamera;
    captureController.delegate = self;
    [self presentViewController:captureController animated:YES completion:nil];
}


/* ---------------------------------------------------------------- */
/*  Call api detect face                                            */
/* ---------------------------------------------------------------- */
- (void)detect:(UIImage *)image {
    [CONTENT_MANAGER detectFace:image showLoading:YES completion:^(BOOL success, NSDictionary *dict, NSString * _Nonnull errorMessage) {
        if(success) {
            NSMutableArray *listFace = [[NSMutableArray alloc]init];
            for(NSDictionary *subDict in dict) {
                FaceModel *faceModel = [FaceModel initWithDictionary:subDict];
                [listFace addObject:faceModel];
            }
            
            if(listFace.count > 0) {
                [self loadText:listFace];
            }
        }
        else {
            [CONTENT_MANAGER showAlertErrorWithMessage:errorMessage fromController:self];
        }
    }];
}


/* ---------------------------------------------------------------- */
/*  Show detect result on text view                                 */
/* ---------------------------------------------------------------- */
- (void)loadText:(NSMutableArray *)arrayFaces {
    
    /*
     *  For layout the detect information item view position in scrollview
     */
    int top = 0;
    
    for(int i = 0; i < [arrayFaces count]; i++) {
        FaceModel *model = arrayFaces[i];
        
        /*
         *  Setup detect information content.
         */
        NSMutableString *appendString = [[NSMutableString alloc]init];
        [appendString appendFormat:@"====== Person %d ======\n\n",i+1];
        [appendString appendFormat:@"%@: \t\t\t\t%@\n",@"Sex",[model.faceAttributes.gender capitalizedString]];
        [appendString appendFormat:@"%@: \t\t\t\t%@\n",@"Age",model.faceAttributes.age];
        [appendString appendFormat:@"%@: \t\t\t%@\n",@"Hair color", [self findHairColor:model.faceAttributes.hair.hairColor]];
        [appendString appendFormat:@"%@: \t\t%@\n",@"Eye makeup",STRING_FROM_BOOL(model.faceAttributes.makeup.eyeMakeup)];
        [appendString appendFormat:@"%@: \t\t\t%@\n",@"Lip makeup",STRING_FROM_BOOL(model.faceAttributes.makeup.lipMakeup)];
        [appendString appendFormat:@"%@: \t\t\t\t%@\n",@"Anger",STRING_FROM_BOOL(model.faceAttributes.emotion.anger)];
        [appendString appendFormat:@"%@: \t\t\t%@\n",@"Contempt",STRING_FROM_BOOL(model.faceAttributes.emotion.contempt)];
        [appendString appendFormat:@"%@: \t\t\t%@\n",@"Disgust",STRING_FROM_BOOL(model.faceAttributes.emotion.disgust)];
        [appendString appendFormat:@"%@: \t\t\t\t%@\n",@"Fear",STRING_FROM_BOOL(model.faceAttributes.emotion.fear)];
        [appendString appendFormat:@"%@: \t\t\t%@\n",@"Happiness",STRING_FROM_BOOL(model.faceAttributes.emotion.happiness)];
        [appendString appendFormat:@"%@: \t\t\t\t%@\n",@"Neutral",STRING_FROM_BOOL(model.faceAttributes.emotion.neutral)];
        [appendString appendFormat:@"%@: \t\t\t%@\n",@"Sadness",STRING_FROM_BOOL(model.faceAttributes.emotion.sadness)];
        [appendString appendFormat:@"%@: \t\t\t%@\n",@"Surprise",STRING_FROM_BOOL(model.faceAttributes.emotion.surprise)];
        [appendString appendFormat:@"%@: \t%@\n",@"Wearing glasses",[self formartGlassesAttribute:model.faceAttributes.glasses]];
        [appendString appendFormat:@"%@: \t\t%@",@"Accessories",[self findAccessory:model.faceAttributes.accessories]];
    
        /*
         *  Detect infomation container view.
         */
        UIView *detectInfoContainer = [[UIView alloc] initWithFrame:CGRectMake(0, top, self.scrollView.width, 0)];
        
        /*
         *  Detect information label.
         */
        UILabel *infoLabel = [[UILabel alloc]initWithFrame:
                                    CGRectMake(0, 0, detectInfoContainer.width-CROPPED_IMAGE_SIZE-MARGIN,0)];
        [infoLabel setBackgroundColor:[UIColor clearColor]];
        [infoLabel setFont:[UIFont systemFontOfSize:14]];
        [infoLabel setTextColor:[UIColor whiteColor]];
        [infoLabel setNumberOfLines:0];
        [infoLabel setText:appendString];
        [infoLabel sizeToFit];
        [detectInfoContainer addSubview:infoLabel];
        
        /*
         *  Detect face rectangle
         */
        UIImage *cloneImage = [self.imageView.image copy];
        UIImage *croppedImage = [cloneImage crop:model.faceRectangle];
        UIImageView *cropImageView = [[UIImageView alloc]initWithFrame:CGRectMake(
                                                 detectInfoContainer.width-CROPPED_IMAGE_SIZE,
                                                 MARGIN,
                                                 CROPPED_IMAGE_SIZE,
                                                 CROPPED_IMAGE_SIZE)];
        [cropImageView setImage:croppedImage];
        [cropImageView setContentMode:UIViewContentModeScaleAspectFill];
        [detectInfoContainer addSubview:cropImageView];
        
        detectInfoContainer.height = infoLabel.bottom;
        
        top = detectInfoContainer.bottom + MARGIN*2;
        
        [self.scrollView addSubview:detectInfoContainer];
        [self.scrollView setContentSize:CGSizeMake(self.scrollView.width,detectInfoContainer.bottom)];
        
        /*
         * Draw a rect on image and update image view uiimage
         */
        UIImage *landmarkImage = [self.imageView.image drawLandmark:model.faceRectangle];
        [self.imageView setImage:landmarkImage];
        
    }
}


/* ---------------------------------------------------------------- */
/*  Format the string in glasses attribute                          */
/* ---------------------------------------------------------------- */
- (NSString *)formartGlassesAttribute:(NSString *)glasses {
    NSString *reverseString = [CONTENT_MANAGER reverseString:glasses];
    NSString *splitString = [reverseString substringToIndex:7];
    NSString *sufixString = [CONTENT_MANAGER reverseString:splitString];
    NSString *prefixString = [glasses componentsSeparatedByString:sufixString][0];
    NSString *mergedString = [[NSString stringWithFormat:@"%@ %@",prefixString, sufixString] capitalizedString];
    return [mergedString length] > 0 ? mergedString : @"N/A";
}


/* ---------------------------------------------------------------- */
/*  Find the highest confident value for hair color in array        */
/* ---------------------------------------------------------------- */
- (NSString *)findHairColor:(NSMutableArray *)array {
    if(array.count > 0) {
        ColorModel *destColor = array[0];
        for(ColorModel *color in array) {
            destColor = color.confidence > destColor.confidence ? color : destColor;
        }
        return [destColor.color capitalizedString];
    }
    return @"N/A";
}


/* ---------------------------------------------------------------- */
/*  Find the highest confident value for accessory in array         */
/* ---------------------------------------------------------------- */
- (NSString *)findAccessory:(NSMutableArray *)array {
    if(array.count > 0) {
        AccessoryModel *destAccessory = array[0];
        for(AccessoryModel *accessory in array) {
            destAccessory = accessory.confidence > destAccessory.confidence ? accessory : destAccessory;
        }
        return [destAccessory.type capitalizedString];
    }
    return @"N/A";
}


#pragma mark - Image Picker Delegate

/* ---------------------------------------------------------------- */
/*  Pick image result                                               */
/* ---------------------------------------------------------------- */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    /*
     *  Clear previous content in scrollView
     */
    for(UIView *v in [self.scrollView subviews])
        [v removeFromSuperview];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *selectedImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
    [selectedImage fixOrientation];
    [self.imageView setImage:selectedImage];
    
    UIGraphicsBeginImageContext(self.containerView.bounds.size);
    [selectedImage drawInRect:self.containerView.bounds];
    UIImage *imageFlatten = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.containerView setBackgroundColor:[UIColor colorWithPatternImage:imageFlatten]];
    [self detect:selectedImage];
}

@end
