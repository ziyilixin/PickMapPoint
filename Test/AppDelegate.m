//
//  AppDelegate.m
//  Test
//
//  Created by zzqtkj on 2021/6/1.
//

#import "AppDelegate.h"
#import <QMapKit/QMapKit.h>
#import <QMapKit/QMSSearchKit.h>
#import "EntryViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [QMapServices sharedServices].APIKey = @"FV7BZ-TZY62-F6LUQ-CVY5R-AVBDS-NEF5Z";
    [QMSSearchServices sharedServices].apiKey = @"FV7BZ-TZY62-F6LUQ-CVY5R-AVBDS-NEF5Z";
    
    if ([QMapServices sharedServices].APIKey.length == 0 || [QMSSearchServices sharedServices].apiKey.length == 0)
    {
        NSLog(@"Please configure API key before using QMapKit.framework");
    }
    
    EntryViewController *entry = [[EntryViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:entry];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
