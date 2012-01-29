//
//  BWViewController.h
//  BWKit
//
//  Created by Bruno Wernimont on 6/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BKViewControllerDelegate

- (void)viewDidAppear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;

@property (nonatomic, retain) UIView *view;
- (UIView *)view;

@end
