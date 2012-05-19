#import "Kiwi.h"

SPEC_BEGIN(BKIterationHelperSpecs)

describe(@"when iterating", ^{
    it(@"should iterate til 5", ^{
        __block int i = 0;
        int mustEgalTo = 4;
        
        [BKIteratingHelper iterateTil:mustEgalTo usingBlock:^(int number) {
            i++;
        }];
        
        [[BK_INT(i) should] equal:BK_INT(mustEgalTo)];
    });
    
    it(@"should iterate by 2", ^{
        __block int i = 0;
        
        [BKIteratingHelper iterateTil:6 bySlice:2 usingBlock:^(int number) {
            i++;
        }];
        
        [[BK_INT(i) should] equal:BK_INT(3)];
    });
});

SPEC_END