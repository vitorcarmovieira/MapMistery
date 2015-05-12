//
//  MMCustomAnnotation.m
//  MapMistery
//
//  Created by Vitor on 5/12/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import "MMCustomAnnotation.h"

@implementation MMCustomAnnotation

- (id)initWithTitle:(NSString *)title andCoordinate:(CLLocationCoordinate2D)coordinate{
    
    self = [super init];
    if (self) {
        _title = title;
        _coordinate = coordinate;
    }
    return self;
}

- (MKAnnotationView *)annotationView{
    
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self
                                                                    reuseIdentifier:@"CustomAnnotation"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"teste.png"];
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    imageView.image = [UIImage imageNamed:@"teste.png"];
    annotationView.leftCalloutAccessoryView = imageView;
    
    return annotationView;
}

@end
