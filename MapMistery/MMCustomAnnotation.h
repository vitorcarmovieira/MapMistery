//
//  MMCustomAnnotation.h
//  MapMistery
//
//  Created by Vitor on 5/12/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface MMCustomAnnotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

- (id) initWithTitle:(NSString *)title andCoordinate:(CLLocationCoordinate2D)coordinate;
- (MKAnnotationView *) annotationView;

@end
