//
//  InsertDelegate.h
//  fruitapp
//
//  Created by Roberta Marino on 25/12/12.
//  Copyright (c) 2012 kodlounge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fruit.h"

@protocol InsertDelegate <NSObject>

-(void)insertNewFruit:(Fruit*)fruit;

@end
