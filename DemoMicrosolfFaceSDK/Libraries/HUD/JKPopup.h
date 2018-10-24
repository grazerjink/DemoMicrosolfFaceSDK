//
//  JKPopup.h
//  JKPopup
//
//  Created by Joris Kluivers on 3/2/12.
//  Copyright (c) 2012 Cardcloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKPopup : UIView

- (void) show;
- (void) showAnimated:(BOOL)animated;

- (void) hide;
- (void) hideAnimated:(BOOL)animated;

@end
