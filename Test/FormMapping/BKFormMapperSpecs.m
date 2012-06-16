#import "Kiwi.h"
#import "Book.h"
#import "BKFormMapper.h"

SPEC_BEGIN(BKFormMapperSpecs)

describe(@"", ^{
    BKFormModel __block *_formModel;
    Book __block *_book;
    BKFormMapping __block *_formMapping;
    BKFormMapper __block *_mapper;
    id firstSectionTitle = @"Title";
    CGFloat customCellRowHeight = 70;
    
    beforeEach(^{
        _formModel = [BKFormModel formTableModelForTableView:nil navigationController:nil];
        _book = [[Book alloc] init];
        _book.title = @"title";
        _book.content = @"content";
        _book.shortName = @"SWEVI";
        _book.suitAllAges = [NSNumber numberWithBool:YES];
        _book.numberOfActor = [NSNumber numberWithInt:4];
        _book.releaseDate = [NSDate date];
        _book.rate = [NSNumber numberWithInt:5];
        
        [BKFormMapping mappingForClass:[Book class] block:^(BKFormMapping *formMapping) {
            [formMapping sectiontTitle:firstSectionTitle identifier:@"info"];
            [formMapping mapAttribute:@"title" title:@"Title" type:BKFormAttributeMappingTypeText];
            [formMapping mapAttribute:@"releaseDate" title:@"ReleaseDate" type:BKFormAttributeMappingTypeDatePicker dateFormat:@"yyyy-MM-dd HH:mm:ss"];
            [formMapping mapAttribute:@"suitAllAges" title:@"All ages" type:BKFormAttributeMappingTypeBoolean];
            [formMapping mapAttribute:@"shortName" title:@"ShortName" type:BKFormAttributeMappingTypeLabel];
            [formMapping mapAttribute:@"rate" title:@"Rate" type:BKFormAttributeMappingTypeSlider];
            [formMapping sectiontTitle:@"Second section" identifier:@"second_section"];
            [formMapping mapAttribute:@"numberOfActor" title:@"Number of actor" type:BKFormAttributeMappingTypeInteger];
            [formMapping mapAttribute:@"content" title:@"Content" type:BKFormAttributeMappingTypeBigText];
            
            [formMapping mapCustomCell:[UITableView class]
                            identifier:@"custom"
                             rowHeight:customCellRowHeight
                  willDisplayCellBlock:nil
                        didSelectBlock:nil];
            
            [_formModel registerMapping:formMapping];
            _formMapping = formMapping;
        }];
        
        _mapper = [[BKFormMapper alloc] initWithFormMapping:_formMapping
                                                  tabelView:nil
                                                     object:_book
                                                  formModel:_formModel];
    });
    
    it(@"should be right number of sections", ^{
        id expected = theValue(2);
        id value = theValue([_mapper numberOfSections]);
        [[value should] equal:expected];
    });
    
    it(@"should be right number of rows in section", ^{
        id expected = theValue(3);
        id value = theValue([_mapper numberOfRowsInSection:1]);
        [[value should] equal:expected];
    });
    
    it(@"should be right title", ^{
        id expected = firstSectionTitle;
        id value = [_mapper titleForHeaderInSection:0];
        [[value should] equal:expected];
    });
    
    it(@"should be right attribute mapping", ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        BKFormAttributeMapping *attributeMapping = [_mapper attributeMappingAtIndexPath:indexPath];
        [[theValue(attributeMapping.type) should] equal:theValue(BKFormAttributeMappingTypeText)];
        [[attributeMapping.title should] equal:@"Title"];
        [[attributeMapping.attribute should] equal:@"title"];
    });
    
    it(@"should return right value for attribute", ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        BKFormAttributeMapping *attributeMapping = [_mapper attributeMappingAtIndexPath:indexPath];
        id value = [_mapper valueForAttriteMapping:attributeMapping];;
        id expected = _book.title;        
        [[value should] equal:expected];
    });
    
    it(@"should be right index path", ^{
        id expected = [NSIndexPath indexPathForRow:0 inSection:0];
        BKFormAttributeMapping *attributeMapping = [_mapper attributeMappingAtIndexPath:expected];
        id value = [_mapper indexPathOfAttributeMapping:attributeMapping];
        [[value should] equal:expected];
    });
    
    it(@"should set value for attribute", ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        BKFormAttributeMapping *attributeMapping = [_mapper attributeMappingAtIndexPath:indexPath];
        id expected = @"new title";
        [_mapper setValue:expected forAttributeMapping:attributeMapping];
        [[_book.title should] equal:expected];
    });
    
    it(@"should return cutom row height", ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:1];
        CGFloat expected = customCellRowHeight;
        CGFloat value = [_mapper heightForRowAtIndexPath:indexPath];
        [[theValue(value) should] equal:theValue(expected)];
    });
    
    context(@"cell relative to attribute", ^{
        
        // BKFormAttributeMappingTypeText
        it(@"should be BKTextField", ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            id cell = [_mapper cellForRowAtIndexPath:indexPath];
            [[theValue([cell class]) should] equal:theValue([BKTextField class])];
        });
        
        // BKFormAttributeMappingTypeDatePicker
        it(@"should be BKLabelField", ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
            id cell = [_mapper cellForRowAtIndexPath:indexPath];
            [[theValue([cell class]) should] equal:theValue([BKLabelField class])];
        });
        
        // BKFormAttributeMappingTypeBoolean
        it(@"should be BKSwitchField", ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
            id cell = [_mapper cellForRowAtIndexPath:indexPath];
            [[theValue([cell class]) should] equal:theValue([BKSwitchField class])];
        });
        
        // BKFormAttributeMappingTypeLabel
        it(@"should be BKSwitchField", ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
            id cell = [_mapper cellForRowAtIndexPath:indexPath];
            [[theValue([cell class]) should] equal:theValue([BKLabelField class])];
        });
        
        // BKFormAttributeMappingTypeSlider
        it(@"should be BKSwitchField", ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:4 inSection:0];
            id cell = [_mapper cellForRowAtIndexPath:indexPath];
            [[theValue([cell class]) should] equal:theValue([BKSliderField class])];
        });
        
        // BKFormAttributeMappingTypeInteger
        it(@"should be BKIntegerField", ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
            id cell = [_mapper cellForRowAtIndexPath:indexPath];
            [[theValue([cell class]) should] equal:theValue([BKIntegerField class])];
        });
        
        // BKFormAttributeMappingTypeBigText
        it(@"should be BKFormAttributeMappingTypeBigText", ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:1];
            id cell = [_mapper cellForRowAtIndexPath:indexPath];
            [[theValue([cell class]) should] equal:theValue([BKBigTextField class])];
        });
        
    });
    
});

SPEC_END