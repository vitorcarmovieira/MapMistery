//
//  MMCasoStore.m
//  MapMistery
//
//  Created by Vitor on 5/11/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import "MMCasoStore.h"
#import "Caso.h"
@import CoreData;

@interface MMCasoStore ()

@property (nonatomic) NSMutableArray *privateItens;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation MMCasoStore

+ (instancetype) sharedStore {
    
    static MMCasoStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
        
        [sharedStore resetStoredData];
    }
    
    return sharedStore;
}

- (instancetype) initPrivate {
    
    self = [super init];
    return self;
}

- (instancetype) init{
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BSTimeStore sheredStore]" userInfo:nil];
    return nil;
}

- (void) setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext{
    
    if (!self.managedObjectContext) {
        _managedObjectContext = managedObjectContext;
        [self loadAllCasos];
    }
}

- (void)addNewCasoByHistoria:(NSString *)historia andCriminoso:(NSString *)criminoso{
    
    Caso *caso = [NSEntityDescription insertNewObjectForEntityForName:@"Caso" inManagedObjectContext:self.managedObjectContext];
    
    caso.id = [[[NSUUID alloc] init] UUIDString];
    caso.historia = historia;
    caso.criminoso = criminoso;
    
    NSError *error;
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Could not save %@, %@", error, error.userInfo);
    }
}

- (void)resetStoredData
{
    
    // Delete all objects
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Caso"];
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
    [self addNewCasoByHistoria:@"Aqui vem a historia" andCriminoso:@"Nome do criminoso"];
}

- (void) loadAllCasos {
    
    if (!self.privateItens) {
        
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Caso"];
        NSError *error;
        
        NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if (!result) {
            [NSException raise:@"fetch failed" format:@"Reason: %@", [error localizedDescription]];
        }
        
        self.privateItens = [NSMutableArray arrayWithArray:result];
    }
}

- (NSArray *) getAllContacts{
    
    return [self.privateItens copy];
}

@end
