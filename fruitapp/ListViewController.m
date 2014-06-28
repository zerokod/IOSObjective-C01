//
//  ListViewController.m
//  fruitapp
//
//  Created by Roberta Marino on 24/12/12.
//  Copyright (c) 2012 kodlounge. All rights reserved.
//

#import "ListViewController.h"
#import "InsertDelegate.h"
#import "Fruit.h"

@interface ListViewController ()

@end


@implementation ListViewController


@synthesize tableView = _tableView;
@synthesize fruit = fruitObject;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CGRect tableViewFrame = [[UIScreen mainScreen] bounds];
        _tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [self.view addSubview:_tableView];
        _itemsList = [[NSMutableArray alloc] init]; 
        self.view.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
       
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewFruit:(Fruit *)fruit{
    NSLog(@"Nuovo frutto!");
    [_itemsList addObject:fruit];
    [_tableView reloadData];
    NSLog(@"list: %@", _itemsList);
}

- (int)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_itemsList count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[_itemsList objectAtIndex:indexPath.row]name];
    cell.detailTextLabel.text = [[_itemsList objectAtIndex:indexPath.row]origin];
    cell.imageView.image = [[_itemsList objectAtIndex:indexPath.row]image];
    return cell;
}
@end
