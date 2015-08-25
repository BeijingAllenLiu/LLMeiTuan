//
//  AppDelegate.m
//  美团项目
//
//  Created by AllenLiu on 15/8/26.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "AppDelegate.h"
//导航控制器.
#import "LLMainTabbarController.h"
#import "LLNavController.h"
//五个模块导入完毕.
#import "LLMoreTableViewController.h"
#import "LLMineTabViewController.h"
#import "LLOnsiteTableViewController.h"
#import "LLMerchantTableViewController.h"
#import "LLHomeTableViewController.h"
//导入友盟的头文件

@interface AppDelegate ()

@end

@implementation AppDelegate
//获取到他们的全局的tabar.
+(void)load
{
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //配置跟控制器
    [self initRootController];
    return YES;
}
#pragma mark - 配置项目的跟控制器
- (void)initRootController
{
    //配置项目的根控制器
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //创建一个跟控制器,是UITabbarController.
    LLMainTabbarController *tabbarVc = [[LLMainTabbarController alloc] init];
    
    //开始进行子控制器的创建
    //主页
    LLHomeTableViewController *homeVc = [[LLHomeTableViewController alloc] init];
    LLNavController *nav = [[LLNavController alloc] initWithRootViewController:homeVc];
    nav.title = @"主页";
    homeVc.title = @"主页";
    nav.tabBarItem.image = [[UIImage imageNamed:@"icon_tabbar_homepage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_homepage_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //商家
    LLMerchantTableViewController *merVc = [[LLMerchantTableViewController alloc] init];
    merVc.title = @"商家";
    LLNavController *merNav = [[LLNavController alloc] initWithRootViewController:merVc];
    merVc.title = @"商家";
    merNav.tabBarItem.image = [[UIImage imageNamed:@"icon_tabbar_merchant_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    merNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_merchant_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    //上门
    LLHomeTableViewController *onsite = [[LLHomeTableViewController alloc] init];
    onsite.title = @"上门";
    LLNavController *onsiteNav = [[LLNavController alloc] initWithRootViewController:onsite];
    onsiteNav.tabBarItem.image = [[UIImage imageNamed:@"icon_tabbar_onsite"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    onsiteNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_onsite_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //我的
    LLMineTabViewController *mineVc = [[LLMineTabViewController alloc] init];
    mineVc.title = @"我的";
    LLNavController *mineNav = [[LLNavController alloc] initWithRootViewController:mineVc];
    mineNav.tabBarItem.image = [[UIImage imageNamed:@"icon_tabbar_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_mine_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //更多
    LLMoreTableViewController *moreVc = [[LLMoreTableViewController alloc] init];
    moreVc.title = @"更多";
    LLNavController *moreNav = [[LLNavController alloc] initWithRootViewController:moreVc];
    moreVc.tabBarItem.image = [[UIImage imageNamed:@"icon_tabbar_misc"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    moreVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_misc_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //添加tabbar中去
    [tabbarVc addChildViewController:nav];
    [tabbarVc addChildViewController:merNav];
    [tabbarVc addChildViewController:onsiteNav];
    [tabbarVc addChildViewController:mineNav];
    [tabbarVc addChildViewController:moreNav];
    
    //设置全局的字体是绿色的.
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(54, 185, 175),NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    
    self.window.rootViewController = tabbarVc;
    [self.window makeKeyAndVisible];
}
#pragma mark -  暂时用不到的系统级方法
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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
