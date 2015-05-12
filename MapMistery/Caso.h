//
//  Caso.h
//  MapMistery
//
//  Created by Vitor on 5/12/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Caso : NSManagedObject

@property (nonatomic, retain) NSString * criminoso;
@property (nonatomic, retain) NSString * historia;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * nome;

@end
