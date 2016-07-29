//
//  AppDelegate.m
//  FirstMusic
//
//  Created by Nhữ Duy Đoàn on 7/18/16.
//  Copyright © 2016 com.nhuduydoan. All rights reserved.
//

#import "AppDelegate.h"
#import "NDDTabBarController.h"
#import "FMNavigationController.h"
#import "FMGenresViewController.h"

#import "FMSearchViewController.h"
#import "FMMyPlayListViewController.h"
#import "FMSettingViewController.h"
@import Firebase;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NDDTabBarController *tabbar = [[NDDTabBarController alloc] init];
    tabbar.viewControllers = [self listViews];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (NSArray *) listViews {
    
    FMGenresViewController *homeView = [[FMGenresViewController alloc] init];
    FMNavigationController *navHomeView = [[FMNavigationController alloc] initWithRootViewController:homeView];
    homeView.title = @"Genres";
    navHomeView.tabBarItem.title = @"Genres";
    [navHomeView.tabBarItem setImage:[UIImage imageNamed:@"home"]];
    
    
    FMSearchViewController *tab2 = [[FMSearchViewController alloc] init];
    FMNavigationController *navTab2 = [[FMNavigationController alloc] initWithRootViewController:tab2];
    tab2.title = @"Search";
    navTab2.tabBarItem.title = @"Search";
    [navTab2.tabBarItem setImage:[UIImage imageNamed:@"icon_tab_search"]];
    
    FMMyPlayListViewController *myPlaylist = [[FMMyPlayListViewController alloc] init];
    FMNavigationController *navMyPlaylist = [[FMNavigationController alloc] initWithRootViewController:myPlaylist];
    myPlaylist.title = @"MyPlaylist";
    navMyPlaylist.tabBarItem.title = @"MySongs";
    [navMyPlaylist.tabBarItem setImage:[UIImage imageNamed:@"icon_Tabbar_playlist"]];
    
    FMSettingViewController *settingView = [[FMSettingViewController alloc] init];
    FMNavigationController *navSettingView = [[FMNavigationController alloc] initWithRootViewController:settingView];
    settingView.title = @"Setting";
    navSettingView.tabBarItem.title = @"Setting";
    [navSettingView.tabBarItem setImage:[UIImage imageNamed:@"icon_Tabbar_setting_left"]];
    
    return @[navHomeView, navTab2, navMyPlaylist, navSettingView];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
