//
//  kdlAppDelegate.m
//  fruitapp
//
//  Created by Roberta Marino on 24/12/12.
//  Copyright (c) 2012 kodlounge. All rights reserved.
//

#import "kdlAppDelegate.h"
#import "InsertViewController.h"
#import "ListViewController.h"
#import "InsertDelegate.h"

@implementation kdlAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    NSMutableArray *controllers = [[NSMutableArray alloc] initWithCapacity:2];
    _tabBarController = [[UITabBarController alloc] init];
    
   
    ListViewController *listViewController = [[ListViewController alloc]initWithNibName:nil bundle:nil];
    listViewController.title = @"Lista";
    listViewController.tabBarItem.image= [UIImage imageNamed:@"ipnotico.png"];
    
    
    
    InsertViewController *insertViewController = [[InsertViewController alloc] initWithNibName:nil bundle:nil];
    insertViewController.title= @"Inserimento";
    insertViewController.tabBarItem.image = [UIImage imageNamed:@"tempo.png"];
    
    insertViewController.delegate = listViewController;
    
    
    [controllers addObject:insertViewController];
    [controllers addObject:listViewController];
    _tabBarController.viewControllers=controllers;
    [[self window ] setRootViewController:_tabBarController];
    
    //Fruit *fruit = [[ Fruit alloc] initWithName:nil origin:nil description:nil image:nil];
   
    
    //FirstViewController * myViewController = [[FirstViewController alloc]initWithNibName:nil bundle:nil];
    
    //self.window.rootViewController = myViewController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
