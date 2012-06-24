//
//  ExampleViewController.m
//  ViewDecoratorExample
//
//  Created by Bruno Wernimont on 3/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExampleViewController.h"

#import "BaseKitViewDecorator.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

@synthesize label, btn;

- (id)init
{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadDecoratorWithStrings:@"UIViewControllerDecorator", @"ExampleViewControllerDecorator", nil];
    [self decorateView:self.view withIdentifier:@"background"];
    [self decorateView:self.label withIdentifier:@"default"];
    [self decorateView:self.btn withIdentifier:@"default"];
    [self unloadDecorator];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
