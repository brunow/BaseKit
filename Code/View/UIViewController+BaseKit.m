//
//  UIViewController+BaseKit.m
//  BaseKit
//
//  Created by Bruno Wernimont on 8/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIViewController+BaseKit.h"

#import "BKMacros.h"


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIViewController (BaseKit)


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)presentModalViewControllerWithBlock:(BKViewControllerBlock)viewController
                       navigationController:(BOOL)navigationController
                                   animated:(BOOL)animated {
    
    if (navigationController) {
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:viewController()];
        [self presentModalViewController:nc animated:animated];
        BK_RELEASE(nc);
    } else {
        [self presentModalViewController:viewController() animated:animated];
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)presentModalViewControllerWithBlock:(BKViewControllerBlock)viewController
                                   animated:(BOOL)animated {
    
    [self presentModalViewControllerWithBlock:viewController
                         navigationController:YES
                                     animated:animated];
}


@end
