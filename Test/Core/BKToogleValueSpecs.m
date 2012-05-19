#import "Kiwi.h"

SPEC_BEGIN(BKToogleValueSpecs)

describe(@"on using tootle value", ^{
    
    it(@"should return correct value", ^{
        NSString *firstValue = @"first";
        NSString  *secondValue = @"second";
        
        BKToogleValue *toogleValue = [BKToogleValue firstValue:firstValue secondValue:secondValue];
        BKToogleValue *toogleValue2 = [BKToogleValue firstValue:firstValue secondValue:secondValue];
        
        [toogleValue2 toggle];
        [[theValue(toogleValue.currentValue) should] equal:theValue(firstValue)];
        [[theValue(toogleValue2.currentValue) should] equal:theValue(secondValue)];
    });
    
});

SPEC_END