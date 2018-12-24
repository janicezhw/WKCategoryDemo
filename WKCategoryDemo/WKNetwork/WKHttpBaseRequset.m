//
//  WKHttpBaseRequset.m
//  WKCategoryDemo
//
//  Created by DianShi on 21/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import "WKHttpBaseRequset.h"
#import "ZWKHttpService.h"

@implementation WKHttpBaseRequset

- (void)dealloc{
    [self stop];
}

#pragma mark - Request Action
/*
- (void)start {
//    [self toggleAccessoriesWillStartCallBack];
    [[ZWKHttpService sharedInstance] addRequest:self];
}

- (void)stop {
    [self toggleAccessoriesWillStopCallBack];
    self.delegate = nil;
    [[WKNetworkAgent sharedAgent] cancelRequest:self];
    [self toggleAccessoriesDidStopCallBack];
}

- (void)startWithCompletionBlockWithSuccess:(WKRequestCompletionBlock)success
                                    failure:(WKRequestCompletionBlock)failure {
    [self setCompletionBlockWithSuccess:success failure:failure];
    [self start];
}

#pragma mark - Subclass Override

- (void)requestCompletePreprocessor {
}

- (void)requestCompleteFilter {
}

- (void)requestFailedPreprocessor {
}

- (void)requestFailedFilter {
}

- (NSString *)requestUrl {
    return @"";
}

- (NSString *)cdnUrl {
    return @"";
}

- (NSString *)baseUrl {
    return @"";
}

- (NSTimeInterval)requestTimeoutInterval {
    return 60;
}

- (id)requestArgument {
    return nil;
}

- (id)cacheFileNameFilterForRequestArgument:(id)argument {
    return argument;
}

- (WKRequestMethod)requestMethod {
    return WKRequestMethodGET;
}

- (WKRequestSerializerType)requestSerializerType {
    return WKRequestSerializerTypeHTTP;
}

- (WKResponseSerializerType)responseSerializerType {
    return WKResponseSerializerTypeJSON;
}

- (NSArray *)requestAuthorizationHeaderFieldArray {
    return nil;
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    return nil;
}

- (NSURLRequest *)buildCustomUrlRequest {
    return nil;
}

- (BOOL)useCDN {
    return NO;
}

- (BOOL)allowsCellularAccess {
    return YES;
}

- (id)jsonValidator {
    return nil;
}

- (BOOL)statusCodeValidator {
    NSInteger statusCode = [self responseStatusCode];
    return (statusCode >= 200 && statusCode <= 299);
}
*/
@end
