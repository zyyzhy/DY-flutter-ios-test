//
//  FlutterEventChannelPlugin.m
//  Runner
//
//  Created by 大头科技 on 2020/7/30.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "FlutterEventChannelPlugin.h"
FlutterEventChannel * _eventChannel;
FlutterEventSink  _enventSink;
@implementation FlutterEventChannelPlugin

+ (FlutterEventChannelPlugin *)shareFlutterEventChannelPlugin{
     static FlutterEventChannelPlugin *flutterEventChannelPlugin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        flutterEventChannelPlugin = [[FlutterEventChannelPlugin alloc] init];
    });
    return flutterEventChannelPlugin;
}
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
     _eventChannel = [FlutterEventChannel eventChannelWithName:@"BatteryEventChannel" binaryMessenger:[registrar messenger]];
     FlutterEventChannelPlugin* instance = [[FlutterEventChannelPlugin alloc] init];
    [_eventChannel setStreamHandler:instance];
}

#pragma mark - <FlutterStreamHandler>
//这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(FlutterEventSink)eventSink {
    // arguments flutter给native的参数
    // 回调给flutter， 建议使用实例指向，因为该block可以使用多次
    _enventSink = eventSink;//通过arguments进行区分
    _enventSink(@"ijuoerhueruetrv");
    
//    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
//    [[NSNotificationCenter defaultCenter]addObserverForName:UIDeviceBatteryLevelDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification*notification) {
//                 NSLog(@"电池电量：%.2f", [UIDevice currentDevice].batteryLevel);
//        _enventSink([NSString stringWithFormat:@"%.2f", [UIDevice currentDevice].batteryLevel]);
//
//    }];
    return nil;
}

/// flutter不再接收
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    // arguments flutter给native的参数
    _enventSink = nil;
    return nil;
}

@end
