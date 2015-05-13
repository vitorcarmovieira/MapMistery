//
//  MMCustomAnnotationView.h
//  MapMistery
//
//  Created by Vitor on 5/13/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MMCustomAnnotationView : MKAnnotationView

@property (strong, nonatomic) UIView *calloutView;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)animateCalloutAppearance;

@end
