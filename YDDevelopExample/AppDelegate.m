//
//  AppDelegate.m
//  YDDevelopExample
//
//  Created by Onesoft on 2019/10/31.
//  Copyright © 2019年 Onesoft. All rights reserved.
//

#import "AppDelegate.h"
#import "YDNavigationController.h"
#import "YDExampleController.h"


#if defined(DEBUG)||defined(_DEBUG)
#import "JPFPSStatus.h"
#endif

/// 1 -- 进入基于MVC设计模式的基类设计
/// 0 -- 进入常用的开发Demo
#define CMHDEBUG 0


@interface AppDelegate ()

@end

@implementation AppDelegate

+(AppDelegate *)sharedDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


//testfirst
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self _configureApplication:application initialParamsBeforeInitUI:launchOptions];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
#if CMHDEBUG
#else
    self.window.rootViewController = [[YDNavigationController alloc] initWithRootViewController:[[YDExampleController alloc] init]];
#endif
    [self.window makeKeyAndVisible];

    
    
#if defined(DEBUG)||defined(_DEBUG)
    [self _configDebugModelTools];
#endif
    
    
    
    
    return YES;
}

#pragma mark - 在初始化UI之前配置
- (void)_configureApplication:(UIApplication *)application initialParamsBeforeInitUI:(NSDictionary *)launchOptions{
    /// 显示状态栏
    [application setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 调试(DEBUG)模式
- (void)_configDebugModelTools{
    /// 显示FPS
    [[JPFPSStatus sharedInstance] open];
    
}

@end
