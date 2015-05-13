//
//  MMImageTransformer.m
//  MapMistery
//
//  Created by Vitor on 5/13/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import "MMImageTransformer.h"
@import UIKit;

@implementation MMImageTransformer

+ (Class) transformedValueClass{
    return [NSData class];
}

- (id) transformedValue:(id)value{
    
    if (!value) {
        return nil;
    }
    if ([value isKindOfClass:[NSData class]]) {
        return value;
    }
    return UIImagePNGRepresentation(value);
}

- (id) reverseTransformedValue:(id)value{
    return [UIImage imageWithData:value];
}

@end
