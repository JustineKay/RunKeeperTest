//
//  MKCustomMapOverlay.h
//  MoonRunner
//
//  Created by Justine Gartner on 11/8/15.
//  Copyright © 2015 Justine Kay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MKCustomMapOverlay : MKOverlayRenderer

/**
 *  Color for the overlay. Default color is 'white'
 */
@property (nonatomic, strong) UIColor *overlayColor;

/**
 *  Overlay opacity. Default is '0.2'
 */
@property (nonatomic) CGFloat overlayAlpha;


@end
