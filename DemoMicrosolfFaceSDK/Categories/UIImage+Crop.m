//
//  UIImage+Crop.m
//  DemoMicrosolfFaceSDK
//
//  Created by Winson Mac on 10/23/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import "UIImage+Crop.h"

@implementation UIImage (Crop)


/* ---------------------------------------------------------------- */
/*  Crop a face in detected image                                   */
/* ---------------------------------------------------------------- */
- (UIImage *)crop:(CGRect)rect {
//    CGSize size = self.size;
//    CGFloat scale = self.scale;
//    CGRect faceRect = CGRectMake(rect.origin.x * scale,
//                      rect.origin.y * scale,
//                      rect.size.width * scale,
//                      rect.size.height * scale);
//
//    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, faceRect);
//    UIImage *result = [UIImage imageWithCGImage:imageRef scale:scale orientation:self.imageOrientation];
//    CGImageRelease(imageRef);
//    return result;
    
    UIGraphicsBeginImageContextWithOptions(rect.size, false, self.scale);
    [self drawAtPoint:CGPointMake(-rect.origin.x, -rect.origin.y)];
    UIImage *croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return croppedImage;
}


/* ---------------------------------------------------------------- */
/*  Draw a face landmarks in detected image                         */
/* ---------------------------------------------------------------- */
- (UIImage *)drawLandmark:(CGRect)rect {
    CGSize size = self.size;
    CGFloat scale = self.scale;
    CGRect faceRect = CGRectMake(rect.origin.x * self.scale,
                      rect.origin.y * self.scale,
                      rect.size.width * self.scale,
                      rect.size.height * self.scale);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw the image
    [self drawAtPoint:CGPointZero];
    
    CGContextSaveGState(context);
    CGContextSetStrokeColorWithColor(context, UIColor.greenColor.CGColor);
    CGContextSetLineWidth(context, 10.0);
    CGContextAddRect(context, faceRect);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextRestoreGState(context);
    
    // get the final image
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    // end drawing context
    UIGraphicsEndImageContext();
    
    return newImage;
}


/* ---------------------------------------------------------------- */
/*  When taking a new photo, need measure the orientation of image  */
/* ---------------------------------------------------------------- */
- (UIImage *)fixOrientation {
    
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

@end
