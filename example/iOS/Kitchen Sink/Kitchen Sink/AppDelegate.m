//
//  AppDelegate.m
//  Kitchen Sink
//
//  Created by Peyton Randolph on 8/3/15.
//  Copyright © 2015 metalcv. All rights reserved.
//

#import "AppDelegate.h"

#import "ListViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UINavigationController *navController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
{
    NSArray<ViewControllerSpecificationBlock> *vcSpecs = @[
        ^(ViewControllerSpecificationContinuation k) {
            k(^UIViewController *(){
                return [[ViewController alloc] initWithNibName:nil bundle:nil];
            }, @"Purple");
        }];
    
    ListViewController *listVC = [[ListViewController alloc] initWithVCSpecs:vcSpecs];
    self.navController = [[UINavigationController alloc] initWithRootViewController:listVC];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
