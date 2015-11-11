//
//  ASPolylineRenderer.m
//
//  Created by Adrian Schoenig on 01/08/13.
//
//

#import "ASPolylineRenderer.h"

@interface ASPolylineRenderer () {
  CGMutablePathRef _mutablePath;
}

@property (nonatomic, strong) MKPolyline *polyline;

@end

@implementation ASPolylineRenderer

- (id)initWithPolyline:(MKPolyline *)polyline
{
	self = [super initWithOverlay:polyline];
	if (self) {
		self.polyline    = polyline;
    _mutablePath = CGPathCreateMutable();
    [self constructPath];
		
		// defaults
		self.borderColor      = [UIColor blackColor];
		self.backgroundColor  = [UIColor blackColor];
		self.borderMultiplier = 2.0;
	}
	return self;
}

- (void)dealloc
{
  CGPathRelease(_mutablePath);
  _mutablePath = NULL;
}

- (void)drawMapRect:(MKMapRect)mapRect
					zoomScale:(MKZoomScale)zoomScale
					inContext:(CGContextRef)context
{
	CGFloat baseWidth = self.lineWidth;

  // nice for debugging
//  CGContextSetRGBFillColor(context, (rand() % 255) / 255.0, 0, 0, 0.1);
//  CGContextFillRect(context, [self rectForMapRect:mapRect]);
  
	// draw the border. it's slightly wider than the specified line width.
	[self drawLine:self.borderColor.CGColor
					 width:baseWidth * self.borderMultiplier
		 allowDashes:NO
		forZoomScale:zoomScale
			 inContext:context];

	// a white background.
	[self drawLine:self.backgroundColor.CGColor
					 width:baseWidth
		 allowDashes:NO
		forZoomScale:zoomScale
			 inContext:context];

	// draw the actual line.
	[self drawLine:self.strokeColor.CGColor
					 width:baseWidth
		 allowDashes:YES
		forZoomScale:zoomScale
			 inContext:context];

}

- (void)constructPath
{
	// turn the polyline into a path
	BOOL pathIsEmpty = YES;
	
	for (int i = 0; i < self.polyline.pointCount; i++) {
		CGPoint point = [self pointForMapPoint:self.polyline.points[i]];
		
		if (pathIsEmpty) {
			CGPathMoveToPoint(_mutablePath, nil, point.x, point.y);
			pathIsEmpty = NO;
		} else {
			CGPathAddLineToPoint(_mutablePath, nil, point.x, point.y);
		}
	}
}

#pragma mark - Private helpers

- (void)drawLine:(CGColorRef)color
					 width:(CGFloat)width
		 allowDashes:(BOOL)allowDashes
		forZoomScale:(MKZoomScale)zoomScale
			 inContext:(CGContextRef)context
{
	CGContextAddPath(context, _mutablePath);
	
	// use the defaults which takes care of the dash pattern
	// and other things
	if (allowDashes) {
		[self applyStrokePropertiesToContext:context atZoomScale:zoomScale];
	} else {
		// some setting we still want to apply
		CGContextSetLineCap(context, self.lineCap);
		CGContextSetLineJoin(context, self.lineJoin);
		CGContextSetMiterLimit(context, self.miterLimit);
	}
	
	// now set the colour and width
	CGContextSetStrokeColorWithColor(context, color);
	CGContextSetLineWidth(context, width / zoomScale);
    
    CGContextSetBlendMode(context, kCGBlendModeOverlay);
	
	CGContextStrokePath(context);
}

@end
