//
//  Movie.m
//  CellMappingExample
//
//  Created by Bruno Wernimont on 5/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize type = _type;

- (void)dealloc {
    self.title = nil;
    self.subtitle = nil;
    self.type = nil;
    
    [super dealloc];
}

+ (id)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle type:(NSString *)type {
    Item *item = [[self alloc] init];
    
    item.title = title;
    item.subtitle = subtitle;
    item.type = type;
    
    return [item autorelease];
}

- (NSString *)imageName {
    return @"tux.png";
}

@end
