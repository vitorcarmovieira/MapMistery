//
//  MMPersonagemStore.h
//  MapMistery
//
//  Created by Vitor on 5/12/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Personagem.h"
@import UIKit;
@import CoreData;

@interface MMPersonagemStore : NSObject

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

+ (instancetype)sharedStore;

- (Personagem *)createPersonagemWithNome:(NSString *)nome andPista:(NSString *)pista andImage:(UIImage *)image;

- (BOOL)saveChanges;

@end
