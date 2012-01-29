//
//  NSManagedObject+BaseKitTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 26/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface Movie : NSManagedObject
@end

@implementation Movie
@end


@interface NSManagedObjectBaseKitTest : GHTestCase
@end

@implementation NSManagedObjectBaseKitTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnPrimaryKeyAttribute {
    NSString *primaryKeyAttribute = @"movieID";
    
    GHAssertTrue([[Movie primaryKeyAttribute] isEqualToString:primaryKeyAttribute], nil);
}

@end
