//
//  MKCustomOverlayPathRenderer.m
//  MoonRunner
//
//  Created by Justine Gartner on 11/9/15.
//  Copyright © 2015 Justine Kay. All rights reserved.
//

#import "MKCustomOverlayPathRenderer.h"

@implementation MKCustomOverlayPathRenderer

- (instancetype)initWithOverlay:(id <MKOverlay>)overlay {
    self = [super initWithOverlay:overlay];
    if (self != nil) {
        self.overlayAlpha = 1.0;
        self.overlayColor = [UIColor blackColor];
    }
    return self;
}

- (BOOL)canDrawMapRect:(MKMapRect)mapRect
             zoomScale:(MKZoomScale)zoomScale {
    return true;
}

- (void)drawMapRect:(MKMapRect)mapRect
          zoomScale:(MKZoomScale)zoomScale
          inContext:(CGContextRef)ctx {
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, self.overlayAlpha);
    CGContextSetFillColorWithColor(ctx, self.overlayColor.CGColor);
    CGContextFillRect(ctx, [self rectForMapRect:MKMapRectWorld]);
}


@end
