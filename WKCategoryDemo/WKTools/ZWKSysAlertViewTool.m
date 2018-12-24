//
//  ZWKSysAlertViewTool.m
//  WKCategoryDemo
//
//  Created by DianShi on 17/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import "ZWKSysAlertViewTool.h"

static ZWKSysAlertViewTool *_sharedInstance;


@implementation ZWKSysAlertViewTool


+ (instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ZWKSysAlertViewTool alloc]init];
    });
    return _sharedInstance;
}

-(id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        //        _decoder = [[JSONDecoder alloc] initWithParseOptions:JKSerializeOptionPretty];
    }
    return self;
}

- (void)showOkayAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelTitle:(NSString *)cancelStr cancelHandler:(void (^)())handler{
    
    [self showOkayAlertWithTitle:title andMessage:message cancelTitle:cancelStr otherBtn:nil otherHandler:nil cancleHandler:handler];
}


- (void)showOkayAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelTitle:(NSString *)cancelStr otherBtn:(NSString *)otherStr otherHandler:(void (^)())handler{
    [self showOkayAlertWithTitle:title andMessage:message cancelTitle:cancelStr otherBtn:otherStr otherHandler:handler cancleHandler:^{
        
    }];
}



- (void)showOkayAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelTitle:(NSString *)cancelStr otherBtn:(NSString *)otherStr otherHandler:(void (^)())handler cancleHandler:(void (^)())cancleHandler{
    
    if (!cancelStr) {
        cancelStr = @"好的";
    }
    self.alertHandler = handler;
    self.cancleHandler = cancleHandler;
    if (IOS_VERSION >= 8.0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        // Create the actions.
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            if (cancleHandler) {
                cancleHandler();
            }
        }];
        [alertController addAction:cancelAction];
        
        if (handler) {
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherStr style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                handler();
            }];
            [alertController addAction:otherAction];

        }

        [[APPDELEGATE window].rootViewController presentViewController:alertController animated:YES completion:nil];

        
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelStr otherButtonTitles:otherStr,nil];
        alertView.tag = 1;
        [alertView show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 0) {
        self.alertHandler();
    }else if(buttonIndex == 0){
        self.cancleHandler();
    }else{
        self.alertHandler();
    }
    
}

@end
