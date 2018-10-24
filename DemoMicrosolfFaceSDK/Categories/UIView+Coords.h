//
//  UIView+Coords.h
//  CarFixed
//
//  Created by KJ Mok on 4/20/18.
//  Copyright © 2018 KJAPPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Coords)

/**
 @brief This gives the left Frame coordinate of the receiver.
 This represent the x coordinate of the receiver, this is the frame position.
 */
@property (nonatomic) CGFloat left;

/**
 @brief This gives the top Frame coordinate of the receiver.
 This represent the y coordinate of the receiver, this is the frame position.
 */
@property (nonatomic) CGFloat top;

/**
 @brief This gives the right coordinate of the receiver.
 This represent the x + width coordinate of the receiver, this is the frame position.
 */
@property (nonatomic) CGFloat right;

/**
 @brief This gives the bottom coordinate of the receiver.
 This represent the y + height coordinate of the receiver, this is the frame position.
 */
@property (nonatomic) CGFloat bottom;


/**
 @brief This gives the width coordinate of the receiver.
 This represent the width coordinate of the receiver, this is the frame position.
 */
@property (nonatomic) CGFloat width;

/**
 @brief This gives the height coordinate of the receiver.
 This represent the height coordinate of the receiver, this is the frame position.
 */
@property (nonatomic) CGFloat height;

@end
