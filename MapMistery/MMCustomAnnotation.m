//
//  MMCustomAnnotation.m
//  MapMistery
//
//  Created by Vitor on 5/12/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import "MMCustomAnnotation.h"
#import "MMCustomAnnotationView.h"

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
    NSArray *array = @[@"teste.png", @"MapMystery-23", @"MapMystery-23", @"MapMystery-23"];
    MMCustomAnnotationView *annotationView = [[MMCustomAnnotationView alloc] initWithAnnotation:self
                                                                    reuseIdentifier:@"CustomAnnotation"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = NO;
    annotationView.image = [UIImage imageNamed:[array objectAtIndex:arc4random_uniform(4)]];
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    imageView.image = [UIImage imageNamed:@"teste.png"];
    annotationView.leftCalloutAccessoryView = imageView;
    
    return annotationView;
}

@end
