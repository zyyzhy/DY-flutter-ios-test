//
//  FlutterEventChannelPlugin.h
//  Runner
//
//  Created by 大头科技 on 2020/7/30.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlutterEventChannelPlugin : NSObject<FlutterPlugin>
+ (FlutterEventChannelPlugin*)shareFlutterEventChannelPlugin;

@end

NS_ASSUME_NONNULL_END
