#import "Kiwi.h"

SPEC_BEGIN(UIViewBaseKitSpecs)

describe(@"UIView", ^{
    __block UIView *_view;
    
    beforeEach(^{
        _view = [[UIView alloc] init];
    });
    
    it(@"should have textFields", ^{
        UIView *views = [[UIView alloc] init];
        
        [BKIteratingHelper iterateTil:10 usingBlock:^(int number) {
            UIView *view = [[UIView alloc] init];
            
            if (5 == number || 8 == number) {
                UITextField *textField = [[UITextField alloc] init];
                [view addSubview:textField];
            }
            
            [views addSubview:view];
        }];
        
        int numberOfTextFields = [views findTextFields].count;
        int expected = 2;
        
        [[theValue(numberOfTextFields) should] equal:theValue(expected)];
        
        id firstTextField = [views findFirstTextField];
        [[firstTextField shouldNot] beNil];
    });
    
    it(@"should hide view", ^{
        [_view hide];
        [[theValue(_view.alpha) should] equal:theValue(0)];
    });
    
    it(@"should show view", ^{
        [_view show];
        [[theValue(_view.alpha) should] equal:theValue(1)];
    });
    
});

SPEC_END
