#import "Kiwi.h"

SPEC_BEGIN(NSStringBaseKitSpecs)

describe(@"NSStringBaseKitSpecs", ^{
    
    it(@"should capitalize first letter of first word", ^{
        id expected = @"StringByCapitalizingFirstLetter";
        id value = [(NSString *)@"stringByCapitalizingFirstLetter" stringByCapitalizingFirstLetter];
        [[value should] equal:expected];
    });
    
    it(@"should camelize string", ^{
        id expected = @"myVar";
        id value = [@"my_var" stringByCamelizingString];
        [[value should] equal:expected];
    });
    
    it(@"should contain a given string", ^{
        NSString *aString = @"This string contain hello";
        BOOL containString = [aString containString:@"hello"];
        [[theValue(containString) should] beYes];
    });
    
    it(@"should make underscored string", ^{
        id expected = @"first_letter";
        id value = [@"firstLetter" stringByUnderscoringWord];
        [[value should] equal:expected];
    });
    
});

SPEC_END