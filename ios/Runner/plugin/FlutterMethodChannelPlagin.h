//
//  FlutterMethodChannelPlagin.h
//  Runner
//
//  Created by 大头科技 on 2020/7/28.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface FlutterMethodChannelPlagin : NSObject<FlutterPlugin>
+ (FlutterMethodChannelPlagin *)shareFlutterMethodChannelPlagin;
-(void)invokeToDartMethod:(nonnull NSString*)methodName arg:(id _Nullable)arguments callBackResult:(FlutterResult _Nullable)callback;
@end

NS_ASSUME_NONNULL_END

