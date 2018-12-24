//
//  ZWKHttpService.h
//  WKCategoryDemo
//
//  Created by DianShi on 21/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface ZWKHttpService : NSObject

@property (nonatomic,strong) AFHTTPSessionManager *manager;


+ (instancetype)sharedInstance;

@end
