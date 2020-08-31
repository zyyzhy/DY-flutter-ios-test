//
//  MacrosHeader.h
//  youmaiyun
//
//  Created by 大头科技 on 2019/7/22.
//  Copyright © 2019年 datou. All rights reserved.
//

#ifndef MacrosHeader_h
#define MacrosHeader_h
/**
 *  完美解决Xcode NSLog打印不全的宏 亲测目前支持到8.2bate版
 */
#ifdef DEBUG
//#define NSLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#define NSLog(...) printf("运行时间：%f  行号：%d\n打印结果：%s\n",[[NSDate date]timeIntervalSince1970], __LINE__,[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
#else
#define NSLog(format, ...)
#endif

/** 日志输出 */
#ifdef DEBUG // 开发
#define NSLog(...) NSLog(__VA_ARGS__)
#else // 发布
#define NSLog(...)
#endif

/** 屏幕尺寸 */
#define TSScreenW [UIScreen mainScreen].bounds.size.width
#define TSScreenH [UIScreen mainScreen].bounds.size.height

/** 判断机型 */
#define IS_IPHONE_4_OR_LESS (TSScreenH < 568)
#define IS_IPHONE5 (TSScreenH == 568)
#define IS_IPhone6 (TSScreenH == 667)
#define IS_IPhone6plus (TSScreenH == 736)
#define  isIphoneX_XS  ( TSScreenW == 375.f && TSScreenH == 812.f)
#define  isIphoneXR_XSMax  (TSScreenW == 414.f && TSScreenH == 896.f)
//异性全面屏
#define   isFullScreen    (isIphoneX_XS || isIphoneXR_XSMax)

/** 控件高度 **/
#define IPHONE_NAVIGATIONBAR_HEIGHT  (isFullScreen ? 88 : 64)
#define IPHONE_STATUSBAR_HEIGHT      (isFullScreen ? 44 : 20)
#define IPHONE_SAFEBOTTOMAREA_HEIGHT (isFullScreen ? 34 : 0)
#define IPHONE_TOPSENSOR_HEIGHT      (isFullScreen ? 32 : 0)
#define IPHONE_TABBAR_HEIGHT 49

/** 字体大小 */
#define FONT(a) [UIFont systemFontOfSize:a]

/** self的弱引用 **/
#define TSWeakSelf __weak typeof(self) weakSelf = self;

/** 中文字体 **/
#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]

#define UNICODETOUTF16(x) (((((x - 0x10000) >>10) | 0xD800) << 16)  | (((x-0x10000)&3FF) | 0xDC00))
#define MULITTHREEBYTEUTF16TOUNICODE(x,y) (((((x ^ 0xD800) << 2) | ((y ^ 0xDC00) >> 8)) << 8) | ((y ^ 0xDC00) & 0xFF)) + 0x10000

/** 当前版本 **/
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])

/** APP 版本号 **/
#define appMPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// AppDelegate对象
#define AppDelegateInstance (AppDelegate *)[UIApplication sharedApplication].delegate

// TS存储
#define DTUserDefaults [NSUserDefaults standardUserDefaults]

// 消息中心
#define DTNotificationCenter [NSNotificationCenter defaultCenter]

#define APPNAME [[TSDeviceCheck sharedManager]getAppName]

#endif /* MacrosHeader_h */
