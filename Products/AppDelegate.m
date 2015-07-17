//
//  AppDelegate.m
//  Products
//
//  Created by Fenkins on 23/06/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "AppDelegate.h"
#import "ProductsListTableViewController.h"
#import "AboutViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize tabBarController = _tabBarController;

- (void) dealloc {
    [_window release];
    [super dealloc];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]autorelease];

    UITableViewController *productsListTableViewController = [[[ProductsListTableViewController alloc] init]autorelease];
    UIViewController *aboutViewController = [[[AboutViewController alloc] init]autorelease];
    UINavigationController *navController = [[[UINavigationController alloc]initWithRootViewController:productsListTableViewController]autorelease];
    
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    [[UINavigationBar appearance] setBarTintColor:[UIColor greenColor]];
    [self.navController.navigationBar setTranslucent:NO];
    
    self.tabBarController = [[[UITabBarController alloc] init]autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController,aboutViewController, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
