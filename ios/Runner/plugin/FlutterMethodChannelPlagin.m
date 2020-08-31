//
//  FlutterMethodChannelPlagin.m
//  Runner
//
//  Created by 大头科技 on 2020/7/28.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "FlutterMethodChannelPlagin.h"
FlutterMethodChannel* _channel;
@implementation FlutterMethodChannelPlagin
+ (FlutterMethodChannelPlagin *)shareFlutterMethodChannelPlagin{
     static FlutterMethodChannelPlagin *flutterMethodChannelPlagin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        flutterMethodChannelPlagin = [[FlutterMethodChannelPlagin alloc] init];
    });
    return flutterMethodChannelPlagin;
}
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
 _channel = [FlutterMethodChannel methodChannelWithName:@"MethodChannelPlugin"
        binaryMessenger:[registrar messenger]];
 FlutterMethodChannelPlagin* instance = [[FlutterMethodChannelPlagin alloc] init];
 [registrar addMethodCallDelegate:instance channel:_channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
 if ([@"goToNative" isEqualToString:call.method]) {
     [[NSNotificationCenter defaultCenter] postNotificationName:@"flutterGoToNative" object:nil userInfo:nil];
 } else {
  result(FlutterMethodNotImplemented);
 }
}
-(void)invokeToDartMethod:(nonnull NSString*)methodName arg:(id _Nullable)arguments callBackResult:(FlutterResult _Nullable)callback {
   
    if (_channel == NULL) {
        NSLog(@"MethodChannel is null");
        return;
    }
    if(callback == NULL){
        [_channel invokeMethod:methodName arguments:arguments];
    
    }else{
       [_channel invokeMethod:methodName arguments:arguments result:callback];
         NSLog(@"%@",methodName);
    }
    
}
@end
