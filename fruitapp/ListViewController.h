//
//  ListViewController.h
//  fruitapp
//
//  Created by Roberta Marino on 24/12/12.
//  Copyright (c) 2012 kodlounge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InsertDelegate.h"


@interface ListViewController : UIViewController <InsertDelegate, UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray * _itemsList;
   
}

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIViewController *fruit;

@end
