//
//  Fruit.m
//  fruitapp
//
//  Created by Roberta Marino on 24/12/12.
//  Copyright (c) 2012 kodlounge. All rights reserved.
//

#import "Fruit.h"
#import "InsertViewController.h"
#import "ListViewController.h"
#import <UIKit/UIKit.h>

@implementation Fruit

@synthesize name = _name;
@synthesize origin = _origin;
@synthesize description = _description;
@synthesize image = _image;
@synthesize tableView = _tableView ;



- (id)initWithName:(NSString *)name origin:(NSString *)origin description:(NSString *)description image:(UIImage *)image{
    self = [super init];
   
    if (self){
        _name = [[NSString alloc]initWithString:name];
        _origin = [[NSString alloc]initWithString:origin];
        _description = [[NSString alloc]initWithString:description];
        _image = [[UIImage alloc]initWithCGImage:image.CGImage];
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
        
    }
    return self;
}


@end
