//
//  WKHttpBaseRequset.h
//  WKCategoryDemo
//
//  Created by DianShi on 21/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import <Foundation/Foundation.h>

///  HTTP Request method.
typedef NS_ENUM(NSInteger, WKRequestMethod) {
    WKRequestMethodGET = 0,
    WKRequestMethodPOST,
    WKRequestMethodHEAD,
    WKRequestMethodPUT,
    WKRequestMethodDELETE,
    WKRequestMethodPATCH,
};

///  Request serializer type.
typedef NS_ENUM(NSInteger, WKRequestSerializerType) {
    WKRequestSerializerTypeHTTP = 0,
    WKRequestSerializerTypeJSON,
};

///  Response serializer type, which determines response serialization process and
///  the type of `responseObject`.
typedef NS_ENUM(NSInteger, WKResponseSerializerType) {
    /// NSData type
    WKResponseSerializerTypeHTTP,
    /// JSON object type
    WKResponseSerializerTypeJSON,
    /// NSXMLParser type
    WKResponseSerializerTypeXMLParser,
};

///  Request priority
typedef NS_ENUM(NSInteger, WKRequestPriority) {
    WKRequestPriorityLow = -4L,
    WKRequestPriorityDefault = 0,
    WKRequestPriorityHigh = 4,
};

@protocol AFMultipartFormData;

typedef void (^AFConstructingBlock)(id<AFMultipartFormData> formData);
typedef void (^AFURLSessionTaskProgressBlock)(NSProgress *);

@class WKHttpBaseRequset;

typedef void(^WKRequestCompletionBlock)(WKHttpBaseRequset *request);

@interface WKHttpBaseRequset : NSObject


@property (nonatomic, strong, readonly) NSURLSessionTask *requestTask;

///  This serialized response object. The actual type of this object is determined by
///  `WKResponseSerializerType`. Note this value can be nil if request failed.
///
///  @discussion If `resumableDownloadPath` and DownloadTask is using, this value will
///              be the path to which file is successfully saved (NSURL), or nil if request failed.
@property (nonatomic, strong, readonly) id responseObject;

///  If you use `WKResponseSerializerTypeJSON`, this is a convenience (and sematic) getter
///  for the response object. Otherwise this value is nil.
@property (nonatomic, strong, readonly) id responseJSONObject;

///  This error can be either serialization error or network error. If nothing wrong happens
///  this value will be nil.
@property (nonatomic, strong, readonly) NSError *error;

///  The success callback. Note if this value is not nil and `requestFinished` delegate method is
///  also implemented, both will be executed but delegate method is first called. This block
///  will be called on the main queue.
@property (nonatomic, copy) WKRequestCompletionBlock successCompletionBlock;

///  The failure callback. Note if this value is not nil and `requestFailed` delegate method is
///  also implemented, both will be executed but delegate method is first called. This block
///  will be called on the main queue.
@property (nonatomic, copy) WKRequestCompletionBlock failureCompletionBlock;

///  This can be use to construct HTTP body when needed in POST request. Default is nil.
@property (nonatomic, copy) AFConstructingBlock constructingBodyBlock;

///  This value is used to perform resumable download request. Default is nil.
///
///  @discussion NSURLSessionDownloadTask is used when this value is not nil.
///              The exist file at the path will be removed before the request starts. If request succeed, file will
///              be saved to this path automatically, otherwise the response will be saved to `responseData`
///              and `responseString`. For this to work, server must support `Range` and response with
///              proper `Last-Modified` and/or `Etag`. See `NSURLSessionDownloadTask` for more detail.
@property (nonatomic, strong) NSString *resumableDownloadPath;

///  You can use this block to track the download progress. See also `resumableDownloadPath`.
@property (nonatomic, copy) AFURLSessionTaskProgressBlock resumableDownloadProgressBlock;

///  The priority of the request. Effective only on iOS 8+. Default is `WKRequestPriorityDefault`.
@property (nonatomic) WKRequestPriority requestPriority;

///  Set completion callbacks
- (void)setCompletionBlockWithSuccess:(WKRequestCompletionBlock)success
                              failure:(WKRequestCompletionBlock)failure;

///  Nil out both success and failure callback blocks.
- (void)clearCompletionBlock;

#pragma mark - Request Action
///=============================================================================
/// @name Request Action
///=============================================================================

///  Append self to request queue and start the request.
- (void)start;

///  Remove self from request queue and cancel the request.
- (void)stop;

///  Convenience method to start the request with block callbacks.
- (void)startWithCompletionBlockWithSuccess:(WKRequestCompletionBlock)success
                                    failure:(WKRequestCompletionBlock)failure;

///  The baseURL of request. This should only contain the host part of URL, e.g., http://www.example.com.
///  See also `requestUrl`
- (NSString *)baseUrl;

///  The URL path of request. This should only contain the path part of URL, e.g., /v1/user. See alse `baseUrl`.
///
///  @discussion This will be concated with `baseUrl` using [NSURL URLWithString:relativeToURL].
///              Because of this, it is recommended that the usage should stick to rules stated above.
///              Otherwise the result URL may not be correctly formed. See also `URLString:relativeToURL`
///              for more information.
///
///              Additionaly, if `requestUrl` itself is a valid URL, it will be used as the result URL and
///              `baseUrl` will be ignored.
- (NSString *)requestUrl;

///  Optional CDN URL for request.
- (NSString *)cdnUrl;

///  Requset timeout interval. Default is 60s.
///
///  @discussion When using `resumableDownloadPath`(NSURLSessionDownloadTask), the session seems to completely ignore
///              `timeoutInterval` property of `NSURLRequest`. One effective way to set timeout would be using
///              `timeoutIntervalForResource` of `NSURLSessionConfiguration`.
- (NSTimeInterval)requestTimeoutInterval;

///  Additional request argument.
- (nullable id)requestArgument;

///  HTTP request method.
- (WKRequestMethod)requestMethod;

///  Request serializer type.
- (WKRequestSerializerType)requestSerializerType;

///  Response serializer type. See also `responseObject`.
- (WKResponseSerializerType)responseSerializerType;

///  Username and password used for HTTP authorization. Should be formed as @[@"Username", @"Password"].
- (nullable NSArray<NSString *> *)requestAuthorizationHeaderFieldArray;

///  Additional HTTP request header field.
- (nullable NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary;

@end
