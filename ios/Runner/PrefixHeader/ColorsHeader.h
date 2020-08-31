//
//  ColorsHeader.h
//  youmaiyun
//
//  Created by 大头科技 on 2019/7/22.
//  Copyright © 2019年 datou. All rights reserved.
//

#ifndef ColorsHeader_h
#define ColorsHeader_h
/** 颜色 **/
#define RGBA(r, g, b, a)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define UIColorFromRGB(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBA(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.7]
#define RGB(r, g, b)      RGBA(r, g, b, 1.0f)

// 参数格式为：0xFFFFFF
#define ColorWithRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#define ColorWithRGBA(rgbValue,a) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:((float)a)]


/** 主要色调 */

#define COLOR_MainLeftColor              [UIColor colorWithHexString:@"9DD47F"]//左
#define COLOR_MainRightColor             [UIColor colorWithHexString:@"20B375"]//右。左右渐变
#define COLOR_SecondColor            [UIColor colorWithHexString:@"F8F8F8"]//背景色
#define COLOR_TittleColor            [UIColor colorWithHexString:@"333333"]


#endif /* ColorsHeader_h */
