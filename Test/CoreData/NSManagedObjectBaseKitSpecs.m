#import "Kiwi.h"

@interface Movie : NSManagedObject

@end

@implementation Movie

@end

SPEC_BEGIN(NSManagedObjectBaseKitSpecs)

describe(@"core data primary key", ^{
    
    it(@"should be correct primary key", ^{
        id expected = @"movieID";
        [[[Movie primaryKeyAttribute] should] equal:expected];
    });
    
});

SPEC_END