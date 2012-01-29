//
//  BKIterationHelperTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface BKIterationHelperTest : GHTestCase
@end

@implementation BKIterationHelperTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldIterateTilFour {
    __block int i = 0;
    int mustEgalTo = 4;
    
    [BKIteratingHelper iterateTil:mustEgalTo usingBlock:^(int number) {
        i++;
    }];

    GHAssertTrue(i == mustEgalTo, @"Ok");
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldIterateTilFourByTwo {
    __block int i = 0;
    
    [BKIteratingHelper iterateTil:6 bySlice:2 usingBlock:^(int number) {
        i++;
    }];
    
    GHAssertTrue(i == 3, @"Ok");
}

@end
