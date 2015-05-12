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

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

+ (instancetype)sharedStore;

- (Caso *)createCasoWithNome:(NSString *)nome
                andHistoria:(NSString *)historia andCriminoso:(NSString *)criminoso;

- (BOOL)saveChanges;

@end
