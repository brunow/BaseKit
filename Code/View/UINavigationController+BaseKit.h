//
//  UINavigationController+BaseKit.h
//  BaseKit
//
//  Created by Bruno Wernimont on 8/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BKViewBlocks.h"

@interface UINavigationController (BaseKit)

- (void)pushViewControllerWithBlock:(BKViewControllerBlock)viewController animated:(BOOL)animated;

@end
