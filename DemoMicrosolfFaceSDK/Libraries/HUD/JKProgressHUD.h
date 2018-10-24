//
//  JKProgressHUD.h
//  JKPopup
//
//  Created by Joris Kluivers on 3/2/12.
//  Copyright (c) 2012 Cardcloud. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JKPopup.h"

@interface JKProgressHUD : JKPopup
@property(nonatomic, readonly) UIActivityIndicatorView *activityView;
@end
