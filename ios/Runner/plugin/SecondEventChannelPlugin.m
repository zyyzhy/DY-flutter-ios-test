//
//  SecondEventChannelPlugin.m
//  Runner
//
//  Created by 大头科技 on 2020/7/31.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "SecondEventChannelPlugin.h"
FlutterEventChannel * _secEventChannel;
FlutterEventSink  _secEnventSink;
@implementation SecondEventChannelPlugin
+(SecondEventChannelPlugin*)shareSecondEventChannelPlugin{
    static SecondEventChannelPlugin *secondEventChannelPlugin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        secondEventChannelPlugin = [[SecondEventChannelPlugin alloc] init];
    });
    return secondEventChannelPlugin;
}
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
     _secEventChannel = [FlutterEventChannel eventChannelWithName:@"SecondEventChannel" binaryMessenger:[registrar messenger]];
     SecondEventChannelPlugin* instance = [[SecondEventChannelPlugin alloc] init];
    [_secEventChannel setStreamHandler:instance];
}

#pragma mark - <FlutterStreamHandler>
//这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(FlutterEventSink)eventSink {
    // arguments flutter给native的参数
    // 回调给flutter， 建议使用实例指向，因为该block可以使用多次
    _secEnventSink = eventSink;//通过arguments进行区分
    _secEnventSink(@"ehuwcrh3882384358");
    return nil;
}

/// flutter不再接收
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    // arguments flutter给native的参数
    _secEnventSink = nil;
    return nil;
}

@end
