//
//  ZWKBaseViewController+ShowAlert.m
//  WKCategoryDemo
//
//  Created by DianShi on 16/02/2017.
//  Copyright © 2017 WK. All rights reserved.
//

#import "ZWKBaseViewController+ShowAlert.h"

@implementation ZWKBaseViewController (ShowAlert)

- (void)showOkayAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelTitle:(NSString *)cancelStr cancelHandler:(void (^)())handler{
    
    if (!cancelStr) {
        cancelStr = @"好的";
    }
    
    self.alertHandler = handler;
    if (IOS_VERSION >= 8.0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        // Create the actions.
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            //        debugLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
            handler();
        }];
        
        //    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //        debugLog(@"The \"Okay/Cancel\" alert's other action occured.");
        //    }];
        
        // Add the actions.
        [alertController addAction:cancelAction];
        //    [alertController addAction:otherAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelStr otherButtonTitles:nil];
        alertView.tag = 0;
        [alertView show];
    }
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
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherStr style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            handler();
        }];
        
        // Add the actions.
        [alertController addAction:cancelAction];
        [alertController addAction:otherAction];
        
//        UIAlertController *alertController2 = [UIAlertController alertControllerWithTitle:@"2" message:message preferredStyle:UIAlertControllerStyleAlert];
//        
//        // Create the actions.
//        
//        UIAlertAction *cancelAction2 = [UIAlertAction actionWithTitle:@"2" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//            if (cancleHandler) {
//                cancleHandler();
//            }
//        }];
//        
//        UIAlertAction *otherAction2 = [UIAlertAction actionWithTitle:@"2" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            handler();
//        }];
//        
//        // Add the actions.
//        [alertController2 addAction:cancelAction2];
//        [alertController2 addAction:otherAction2];

    [self presentViewController:alertController animated:YES completion:nil];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [[APPDELEGATE window].rootViewController presentViewController:alertController2 animated:YES completion:nil];
//        });
        
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
