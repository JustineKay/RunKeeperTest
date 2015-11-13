//
//  ClearPathPolylineOverlay.h
//  MoonRunner
//
//  Created by Justine Kay 🙏🏼 on 11/9/15.
//  Copyright © 2015 Justine Kay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ClearPathPolylineOverlay : NSObject <MKOverlay> {
    
    MKPolyline *polyline;
}

@property (nonatomic, retain) MKPolyline* polyline;

+ (ClearPathPolylineOverlay *)initWithPolyline: (MKPolyline*) line;

@end
