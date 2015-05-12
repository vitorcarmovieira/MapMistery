//
//  MMCasoStore.h
//  MapMistery
//
//  Created by Vitor on 5/11/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Caso.h"
@import CoreData;

@interface MMCasoStore : NSObject

@property (nonatomic) NSArray *casos;

+ (instancetype) sharedStore;

- (void) addNewCasoByHistoria:(NSString *)historia andCriminoso:(NSString *)criminoso;

- (NSArray *) getAllCasos;

- (void) setManagedObjectContext:(NSManagedObjectContext *) managedObjectContext;

@end
