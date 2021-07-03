//
//  AppDelegate.m
//  rs.ios.stage-task7
//
//  Created by alex on 3.07.21.
//

#import "AppDelegate.h"
#import "AuthorizationVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    
    AuthorizationVC *rootVC = [[AuthorizationVC alloc] init];
    window.rootViewController = rootVC;
    
    self.window = window;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


@end
