//
//  ZWKConsts.h
//  WKPublicClassDemo
//
//  Created by DianShi on 15/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#ifndef ZWKConsts_h
#define ZWKConsts_h

// 接口地址
//内网测试
//static NSString * const KROOTURL = @"http://192.168.5.48:8291/";   // 乡南 测试token
//static NSString * const KIMAGEURLHEAD = @"http://cspic.dzq.com/";
//static NSString * const KROOTURL = @"http://192.168.5.137:8291/";
//#define KCommodityDetailURL KROOTURL

//static NSString * const KROOTURL = @"http://192.168.5.47:8088/";  // 德昌 测试接口店铺信息
//static NSString * const KROOTURL = @"http://192.168.5.137:8288/";
//static NSString * const KROOTURL = @"http://192.168.5.46:8080/";      // 龙涛 测试


//外网测试
static NSString * const KIMAGEURLHEAD       = @"http://cspic.dzq.com/";
static NSString * const KROOTURL            = @"http://apptest1.dzq.com/";
static NSString * const KCommodityDetailURL = @"http://shoptest1.dzq.com/";
static NSString * const KQRCodeURL          = @"http://mtest1.dzq.com/qcode/";

//外网测试
//static NSString * const KIMAGEURLHEAD       = @"http://cspic.dzq.com/";
//static NSString * const KROOTURL            = @"http://apitest2.dzq.com/";
//static NSString * const KCommodityDetailURL = @"http://shoptest2.dzq.com/";
//static NSString * const KQRCodeURL          = @"http://mtest2.dzq.com/qcode/";

//正式地址
//static NSString * const KIMAGEURLHEAD       = @"http://pic.dzq.com/";
//static NSString * const KROOTURL            = @"http://api.dzq.com/";
//static NSString * const KCommodityDetailURL = @"http://shop1.dzq.com/";
//static NSString * const KQRCodeURL          = @"http://m.dzq.com/qcode/";

//常用颜色值
static NSString * const DSBackgroundColor    = @"f5f5f5";
static NSString * const DSBlackColor         = @"323232";
static NSString * const DSGrayColor          = @"999999";
static NSString * const DSBlueColor          = @"489df3";
static NSString * const DSSeparatorLineColor = @"dcdcdc";
static NSString * const DSChatColor          = @"a3cef9";
static NSString * const DSRedColor           = @"FD5C48";

// 常用字体大小
static CGFloat  const kFontSizeNavTitle = 18;
static CGFloat  const kFontSizeTitle    = 16;
static CGFloat  const kFontSizeContent  = 14;
static CGFloat  const kRadiuSize = 3;

/// 个推开发者网站中申请App时，注册的AppId、AppKey、AppSecret
static NSString * const kGtAppId     = @"y0izT6APO79jjeq4jDxBL";
static NSString * const kGtAppKey    = @"Kp5uM5lFOM7CDF9lqVIEv7";
static NSString * const kGtAppSecret = @"uY9tpaUGV18mEQg7d7yf71";

// 友盟Appkey
static NSString * const UMENG_APPKEY = @"54eecfb2fd98c5323e0001ef";
// 微信Appkey
static NSString * const KWXAppID = @"wxf30d5d494b8e4826";
static NSString * const kWKPartnerId = @"1283639401";


#endif /* ZWKConsts_h */
