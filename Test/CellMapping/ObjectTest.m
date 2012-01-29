//
//  Object.m
//  BaseKit
//
//  Created by Bruno Wernimont on 2/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ObjectTest.h"

@implementation ObjectTest

@synthesize title;
@synthesize fullName;
@synthesize image;

- (void)dealloc {
    self.title = nil;
    self.fullName = nil;
    self.image = nil;
    
    [super dealloc];
}

@end
