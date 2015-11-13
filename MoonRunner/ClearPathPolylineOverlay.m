//
//  ClearPathPolylineOverlay.m
//  MoonRunner
//
//  Created by Justine Kay 🙏🏼 on 11/9/15.
//  Copyright © 2015 Justine Kay. All rights reserved.
//

#import "ClearPathPolylineOverlay.h"

@implementation ClearPathPolylineOverlay

@synthesize polyline;

//+ (UserPathPolylineOverlay *)initWithPolyline: (MKPolyline*) line {
//    
//    UserPathPolylineOverlay *userPath = [[UserPathPolylineOverlay alloc] init];
//    userPath.polyline = line;
//    return [userPath autorelease];
//}
//
//- (void) dealloc {
//    [polyline release];
//    polyline = nil;
//    [super dealloc];
//}

#pragma mark MKOverlay
//@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
- (CLLocationCoordinate2D) coordinate {
    return [polyline coordinate];
}

//@property (nonatomic, readonly) MKMapRect boundingMapRect;
- (MKMapRect) boundingMapRect {
    return [polyline boundingMapRect];
}

- (BOOL)intersectsMapRect:(MKMapRect)mapRect {
    return [polyline intersectsMapRect:mapRect];
}

- (MKMapPoint *) points {
    return [polyline points];
}


-(NSUInteger) pointCount {
    return [polyline pointCount];
}

- (void)getCoordinates:(CLLocationCoordinate2D *)coords range:(NSRange)range {
    return [polyline getCoordinates:coords range:range];
}


@end
