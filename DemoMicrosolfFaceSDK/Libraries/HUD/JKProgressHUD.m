//
//  JKProgressHUD.m
//  JKPopup
//
//  Created by Joris Kluivers on 3/2/12.
//  Copyright (c) 2012 Cardcloud. All rights reserved.
//

#import "JKProgressHUD.h"

#import <QuartzCore/QuartzCore.h>

@implementation JKProgressHUD

@synthesize activityView=_activityView;

- (id) initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.8f];
		self.layer.cornerRadius = 9.0f;
		
		_activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//        _activityView.color=COLORLIST_LIGHT_BLUE;
		[self addSubview:_activityView];
	}
	return self;
}

- (void) layoutSubviews {
	[super layoutSubviews];
	
	CGRect activityFrame = self.activityView.frame;
	activityFrame.origin = CGPointMake(
	   floorf((CGRectGetWidth(self.frame) - CGRectGetWidth(activityFrame)) / 2.0f),
	   floorf((CGRectGetHeight(self.frame) - CGRectGetHeight(activityFrame)) / 2.0f)
	);
	self.activityView.frame = activityFrame;
}

- (void) showAnimated:(BOOL)animated {
	[self.activityView startAnimating];
	[super showAnimated:animated];
}

@end
