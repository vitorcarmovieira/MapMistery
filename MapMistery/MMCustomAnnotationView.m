//
//  MMCustomAnnotationView.m
//  MapMistery
//
//  Created by Vitor on 5/13/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import "MMCustomAnnotationView.h"
#import "MMCustomAnnotation.h"

@implementation MMCustomAnnotationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@synthesize calloutView;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    
//    MMCustomAnnotation *ann = self.annotation;
    if(selected)
    {
        //Add your custom view to self...
        calloutView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        calloutView.backgroundColor = [UIColor redColor];
        
        [calloutView setFrame:CGRectMake(-24, 35, 0, 0)];
        [calloutView sizeToFit];
        
        [self animateCalloutAppearance];
        [self addSubview:calloutView];
    }
    else
    {
        //Remove your custom view...
        [calloutView removeFromSuperview];
    }
}

- (void)didAddSubview:(UIView *)subview{
//    Annotation *ann = self.annotation;
//    if (![ann.locationType isEqualToString:@"dropped"]) {
//        if ([[[subview class] description] isEqualToString:@"UICalloutView"]) {
//            for (UIView *subsubView in subview.subviews) {
//                if ([subsubView class] == [UIImageView class]) {
//                    UIImageView *imageView = ((UIImageView *)subsubView);
//                    [imageView removeFromSuperview];
//                }else if ([subsubView class] == [UILabel class]) {
//                    UILabel *labelView = ((UILabel *)subsubView);
//                    [labelView removeFromSuperview];
//                }
//            }
//        }
//    }
}

- (void)animateCalloutAppearance {
    CGFloat scale = 0.001f;
    calloutView.transform = CGAffineTransformMake(scale, 0.0f, 0.0f, scale, 0, -50);
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationCurveEaseOut animations:^{
        CGFloat scale = 1.1f;
        calloutView.transform = CGAffineTransformMake(scale, 0.0f, 0.0f, scale, 0, 2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
            CGFloat scale = 0.95;
            calloutView.transform = CGAffineTransformMake(scale, 0.0f, 0.0f, scale, 0, -2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.075 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
                CGFloat scale = 1.0;
                calloutView.transform = CGAffineTransformMake(scale, 0.0f, 0.0f, scale, 0, 0);
            } completion:nil];
        }];
    }];
}

@end
