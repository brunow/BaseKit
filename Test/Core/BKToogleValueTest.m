//
//  BKToogleValueTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 26/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface BKToogleValueTest : GHTestCase
@end

@implementation BKToogleValueTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnCorrectCurrentValue {
    NSString *firstValue = @"first";
    NSString  *secondValue = @"second";
    
    BKToogleValue *toogleValue = [BKToogleValue firstValue:firstValue secondValue:secondValue];
    BKToogleValue *toogleValue2 = [BKToogleValue firstValue:firstValue secondValue:secondValue];
    
    [toogleValue2 toggle];
    
    GHAssertTrue((toogleValue.currentValue == firstValue && toogleValue2.currentValue == secondValue), nil);
}

@end
