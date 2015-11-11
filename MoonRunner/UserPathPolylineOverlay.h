//
//  UserPathPolylineOverlay.h
//  MoonRunner
//
//  Created by Justine Gartner on 11/9/15.
//  Copyright © 2015 Justine Kay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface UserPathPolylineOverlay : NSObject <MKOverlay> {
    
    MKPolyline *polyline;
}

@property (nonatomic, retain) MKPolyline* polyline;

+ (UserPathPolylineOverlay *)initWithPolyline: (MKPolyline*) line;

@end
