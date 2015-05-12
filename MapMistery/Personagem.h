//
//  Personagem.h
//  MapMistery
//
//  Created by Vitor on 5/11/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Personagem : NSManagedObject

@property (nonatomic, retain) id image;
@property (nonatomic, retain) NSString * pista;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * id;

@end
