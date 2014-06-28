//
//  Fruit.h
//  fruitapp
//
//  Created by Roberta Marino on 24/12/12.
//  Copyright (c) 2012 kodlounge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Fruit : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    
    NSString * _name;
    NSString * _origin;
    NSString * _description;
    UIImage * _image;
    UITableView *_tableView;    
}

- (id)initWithName:(NSString*)name origin:(NSString*)origin description:(NSString*)description image:(UIImage*)image;



@property (nonatomic,strong) NSString* name;
@property (nonatomic,strong) NSString* origin;
@property (nonatomic,strong) NSString* description;
@property (nonatomic,strong) UIImage* image;

@property (strong, nonatomic) UITableView *tableView;

@end
