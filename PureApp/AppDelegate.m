//
//  AppDelegate.m
//  PureApp
//
//  Created by 星风TB on 15/6/22.
//  Copyright (c) 2015年 星风. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    
//Match:url:https://www.tmall.com/wh/tpl/refreshmentwh/index.htm?spm=875.7403452.20000004.2.tVspRf&abbucket=_AB-M670_B15&acm=201505251206-2.1003.2.356600&syncIds=520849297731,4533339&aldid=yJyLAiYt&abtest=_AB-LR670-PR670&scm=1003.2.201505251206-2.11_1437009917003_356600&pos=2
//regex:^http[s]?://([^/?#]+.)*(?:jae.(?:m|wapa|waptest).taobao.com|jaeapp.com|amap.com|autonavi.com|mapabc.com|jaecdn.com|meizhe.goodtp.com)([?|#|/].*)?$
    
//    NSString *url = @"https://www.tmall.com/wh/tpl/refreshmentwh/index.htm";//?spm=875.7403452.20000004.2.tVspRf&abbucket=_AB-M670_B15&acm=201505251206-2.1003.2.356600&syncIds=520849297731,4533339&aldid=yJyLAiYt&abtest=_AB-LR670-PR670&scm=1003.2.201505251206-2.11_1437009917003_356600&pos=2";
//    NSString *regexString = @"^http[s]?://([^/?#]+\\.)*(?:jae\\.(?:m|wapa|waptest)\\.taobao\\.com|jaeapp\\.com|amap\\.com|autonavi\\.com|mapabc\\.com|jaecdn\\.com|meizhe\\.goodtp\\.com)([?|#|/]\\.*)?$";
//    
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:nil];
//    NSRange matchRange = [regex rangeOfFirstMatchInString:url options:NSMatchingReportCompletion range:NSMakeRange(0, url.length)];
//    NSLog(@"xxx");
    return YES;
}

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
