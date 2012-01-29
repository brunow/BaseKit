//
//  NSString+BaseKitTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 26/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface NSStringBaseKitTest : GHTestCase
@end

@implementation NSStringBaseKitTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldCapitalizeFirstLetter {
    NSString *capitalizedString = [@"stringByCapitalizingFirstLetter" stringByCapitalizingFirstLetter];
    
    GHAssertTrue([capitalizedString isEqualToString:@"StringByCapitalizingFirstLetter"], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldCamelizingString {
    NSString *camelizedString = [@"my_var" stringByCamelizingString];
    
    GHAssertTrue([camelizedString isEqualToString:@"myVar"], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldCamelizingLittleString {
    NSString *camelizedString = [@"var" stringByCamelizingString];
    
    GHAssertTrue([camelizedString isEqualToString:@"var"], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldContainString {
    NSString *aString = @"This string contain hello";
    
    GHAssertTrue([aString containsString:@"hello"], nil);
}

@end
