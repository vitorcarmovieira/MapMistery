//
//  MMLocalStore.h
//  MapMistery
//
//  Created by Vitor on 5/12/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Local.h"
@import CoreLocation;

@interface MMLocalStore : NSObject

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

+ (instancetype)sharedStore;

- (Local *)createLocalWithLatitude:(NSNumber*)latitude andLongitude:(NSNumber*)longitude andTitle:(NSString *)title andTipo:(NSString *)tipo;

- (BOOL)saveChanges;

@end
