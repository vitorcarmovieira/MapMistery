//
//  MMPersonagemStore.m
//  MapMistery
//
//  Created by Vitor on 5/12/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import "MMPersonagemStore.h"
#import "Personagem.h"
#import "AppDelegate.h"

@interface MMPersonagemStore ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation MMPersonagemStore

static NSString *DATA_MODEL_ENTITY_NAME = @"Personagem";

+ (instancetype)sharedStore {
    static MMPersonagemStore *sharedStore = nil;
    
    if (!sharedStore) {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        sharedStore = [[self alloc] initPrivate];
        sharedStore.managedObjectContext = appDelegate.managedObjectContext;
        
        //        [sharedStore resetStoredData];
    }
    
    return sharedStore;
}

- (instancetype)initPrivate {
    self = [super init];
    return self;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BPDUnidadeFederativaStore sharedStore]"
                                 userInfo:nil];
}

- (void)resetStoredData
{
    
    // Delete all objects
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:DATA_MODEL_ENTITY_NAME];
    NSError *error;
    NSArray *objects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Error fetching objects: %@", error.userInfo);
    }
    
    [fetchRequest setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    for (NSManagedObject *object in objects) {
        [self.managedObjectContext deleteObject:object];
    }
    
    // Populate with defaults
    [self createPersonagemWithNome:@"Maria Joaquina" andPista:@"Eu vi quem matou aquele velho!"];
}

- (Personagem *)createPersonagemWithNome:(NSString *)nome andPista:(NSString *)pista{
    
    Personagem *personagem = [NSEntityDescription
                  insertNewObjectForEntityForName:DATA_MODEL_ENTITY_NAME
                  inManagedObjectContext:self.managedObjectContext];
    
    personagem.id = [[[NSUUID alloc] init] UUIDString];
    personagem.nome = nome;
    personagem.pista = pista;
    
    NSError *error;
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Could not save %@, %@", error, error.userInfo);
    }
    
    return personagem;
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (!_fetchedResultsController) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:DATA_MODEL_ENTITY_NAME inManagedObjectContext:self.managedObjectContext];
        
        [fetchRequest setEntity:entity];
        
        // Set the batch size to a suitable number.
        [fetchRequest setFetchBatchSize:20];
        
        // Edit the sort key as appropriate.
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nome" ascending:YES];
        NSArray *sortDescriptors = @[sortDescriptor];
        
        [fetchRequest setSortDescriptors:sortDescriptors];
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        // _fetchedResultsController.delegate = self;
        
        NSError *error = nil;
        if (![_fetchedResultsController performFetch:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    
    return _fetchedResultsController;
}

- (BOOL)saveChanges {
    NSError *error;
    
    if ([self.managedObjectContext hasChanges]) {
        BOOL successful = [self.managedObjectContext save:&error];
        
        if (!successful) {
            NSLog(@"Error saving: %@", [error localizedDescription]);
        }
        
        return successful;
    }
    
    return YES;
}

@end
