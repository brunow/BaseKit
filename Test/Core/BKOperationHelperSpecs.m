#import "Kiwi.h"

SPEC_BEGIN(BKOperationHelperSpecs)

describe(@"on running operation", ^{
    
    it(@"should not be run on main thread", ^{
        [BKOperationHelper performBlockInBackground:^{
            id expected = theValue(NO);
            [[expected should] equal:theValue([NSThread isMainThread])];
        }];
    });
    
    it(@"should be run on main thread", ^{
        [BKOperationHelper performBlockInBackground:nil completion:^{
            id expected = theValue(YES);
            [[expected should] equal:theValue([NSThread isMainThread])];
        }];
    });
    
});

SPEC_END