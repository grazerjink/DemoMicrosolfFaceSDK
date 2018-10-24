//
//  ContentManager.h
//  DemoMircosoftFaceAPI
//
//  Created by Winson Mac on 10/19/18.
//  Copyright © 2018 Winson Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "JKProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContentManager : NSObject {
    
    JKProgressHUD       *hud;
    
}

+ (ContentManager *)shareManager;

- (void)detectFace:(UIImage *)imageNeedDetect showLoading:(BOOL)show completion:(void(^)(BOOL success, NSDictionary *dict ,NSString *errorMessage))callBack;

- (void)showAlertErrorWithMessage:(NSString *)errorMessage fromController:(UIViewController *)controller;
- (NSString*)reverseString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
