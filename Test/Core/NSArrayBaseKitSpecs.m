#import "Kiwi.h"

SPEC_BEGIN(NSArrayBaseKitSpecs)

describe(@"when array empty is", ^{
    it(@"should return is empty", ^{
        NSArray *array = [NSArray array];
        [[array should] beEmpty];
    });
});

describe(@"when array not empty", ^{
    __block NSArray *items = nil;
    
    beforeEach(^{
        items = [NSArray arrayWithObjects:@"one", @"two", @"three", @"four", nil];
    });
    
    it(@"should not be empty", ^{
        [[theValue(items.isEmpty) should] beNo];
    });
    
    it(@"should return first object", ^{
        id expected = [items objectAtIndex:0];
        id value = [items objectAtIndex:0];
        [[expected should] equal:value];
    });
});

describe(@"array must return correct type", ^{
    it(@"should return boolean value", ^{
        id expected = theValue(YES);
        NSArray *items = [NSArray arrayWithObject:expected];
        [[theValue([items boolValueAtIndex:0]) should] equal:expected];
    });
    
    it(@"should return int value", ^{
        id expected = theValue(10);
        NSArray *items = [NSArray arrayWithObject:expected];
        [[theValue([items intValueAtIndex:0]) should] equal:expected];
    });
    
    it(@"should return integer value", ^{
        NSUInteger value = 10;
        id expected = theValue(value);
        NSArray *items = [NSArray arrayWithObject:expected];
        [[theValue([items integerValueAtIndex:0]) should] equal:expected];
    });
    
    it(@"should return float value", ^{
        float value = 10.0f;
        id expected = theValue(value);
        NSArray *items = [NSArray arrayWithObject:expected];
        [[theValue([items floatValueAtIndex:0]) should] equal:expected];
    });
    
    it(@"should return double value", ^{
        double value = 10.0f;
        id expected = theValue(value);
        NSArray *items = [NSArray arrayWithObject:expected];
        [[theValue([items doubleValueAtIndex:0]) should] equal:expected];
    });
    
    it(@"should return string value", ^{
        id expected = @"string";
        NSArray *items = [NSArray arrayWithObject:expected];
        [[theValue([items stringValueAtIndex:0]) should] equal:theValue(expected)];
    });
    
    it(@"should return NSNumber value", ^{
        id expected = [NSNumber numberWithInt:10];
        NSArray *items = [NSArray arrayWithObject:expected];
        [[theValue([items numberValueAtIndex:0]) should] equal:theValue(expected)];
    });
});

SPEC_END