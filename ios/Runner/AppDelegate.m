#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "FlutterMethodChannelPlagin.h"
#import "FlutterEventChannelPlugin.h"
#import "SecondEventChannelPlugin.h"
#import "DTNativeController.h"
@implementation AppDelegate
@dynamic window;

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    self.window = [[UIWindow alloc]initWithFrame: [UIScreen mainScreen].bounds];
    self.controller = [[FlutterViewController alloc]init];
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:self.controller];
    [self.navigationController setNavigationBarHidden:YES];
    self.window.rootViewController = self.navigationController;
    
    [GeneratedPluginRegistrant registerWithRegistry:self.controller];
    [FlutterMethodChannelPlagin registerWithRegistrar: [self.controller registrarForPlugin:@"FlutterMethodChannelPlagin"]];
    [FlutterEventChannelPlugin registerWithRegistrar: [self.controller registrarForPlugin:@"FlutterEventChannelPlugin"]];
    [SecondEventChannelPlugin registerWithRegistrar: [self.controller registrarForPlugin:@"SecondEventChannelPlugin"]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nativeVCWillShow:) name:@"flutterGoToNative" object:nil];

    [self.window makeKeyAndVisible];
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
    
}

-(void)nativeVCWillShow:(NSNotification*)notification{
    [self.navigationController pushViewController:[[DTNativeController alloc]init] animated:YES];
}


@end
