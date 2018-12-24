//
//  ZWKHttpService.m
//  WKCategoryDemo
//
//  Created by DianShi on 21/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import "ZWKHttpService.h"

static ZWKHttpService *_sharedInstance;


@implementation ZWKHttpService

+ (instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ZWKHttpService alloc]init];
    });
    return _sharedInstance;
}

-(id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        _manager = [AFHTTPSessionManager manager];
    }
    return self;
}



@end
