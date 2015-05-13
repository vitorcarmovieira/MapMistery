//
//  Local.h
//  MapMistery
//
//  Created by Vitor on 5/12/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Local : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) id image;
@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * longitude;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * idPersonagem;

@end
