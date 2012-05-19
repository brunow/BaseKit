//
// Created by Bruno Wernimont on 2012
// Copyright 2012 BaseKit
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "BKFormMapping.h"

#import "BKFormAttributeMapping.h"
#import "BKMacrosDefinitions.h"


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BKFormMapping ()

- (void)addFieldToOrdersArray:(NSString *)identifier;
- (void)addAttributeMappingToFormMapping:(BKFormAttributeMapping *)attributeMapping;

@end


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BKFormMapping

@synthesize objectClass = _objectClass;
@synthesize fieldsOrder = _fieldsOrder;
@synthesize saveAttribute = _saveAttribute;


////////////////////////////////////////////////////////////////////////////////////////////////////
#if !BK_HAS_ARC
- (void)dealloc {
    [_attributeMappings release];
    [_sectionTitles release];
    [_saveAttribute release];
    self.fieldsOrder = nil;
    
    [super dealloc];
}
#endif


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
    self = [super init];
    
    if (self) {
        _attributeMappings = [[NSMutableDictionary alloc] init];
        _sectionTitles = [[NSMutableDictionary alloc] init];
        _fieldsOrder = [[NSMutableArray alloc] init];
    }
    
    return self;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithObjectClass:(Class)objectClass {
    self = [self init];
    
    if (self) {
        self.objectClass = objectClass;
    }
    
    return self;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)mappingForClass:(Class)objectClass block:(void(^)(BKFormMapping *formMapping))block {
    BKFormMapping *formMapping = [[self alloc] initWithObjectClass:objectClass];
    
    block(formMapping);
    
    return BK_AUTORELEASE(formMapping);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapAttribute:(NSString *)attribute
               title:(NSString *)title
     placeholderText:(NSString *)placeholderText
                type:(BKFormAttributeMappingType)type {
    
    BKFormAttributeMapping *attributeMapping = [BKFormAttributeMapping attributeMapping];
    attributeMapping.title = title;
    attributeMapping.attribute = attribute;
    attributeMapping.type = type;
    attributeMapping.placeholderText = placeholderText;
    
    [self addAttributeMappingToFormMapping:attributeMapping];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapAttribute:(NSString *)attribute title:(NSString *)title {
    BKFormAttributeMapping *attributeMapping = [BKFormAttributeMapping attributeMapping];
    attributeMapping.title = title;
    attributeMapping.attribute = attribute;
    
    [self addAttributeMappingToFormMapping:attributeMapping];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapAttribute:(NSString *)attribute
               title:(NSString *)title
                type:(BKFormAttributeMappingType)type {
    
    BKFormAttributeMapping *attributeMapping = [BKFormAttributeMapping attributeMapping];
    attributeMapping.title = title;
    attributeMapping.attribute = attribute;
    attributeMapping.type = type;
    
    [self addAttributeMappingToFormMapping:attributeMapping];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapAttribute:(NSString *)attribute
               title:(NSString *)title
                type:(BKFormAttributeMappingType)type
     dateFormatBlock:(BKFormMappingDateFormatBlock)dateFormatBlock {
    
    BKFormAttributeMapping *attributeMapping = [BKFormAttributeMapping attributeMapping];
    attributeMapping.title = title;
    attributeMapping.attribute = attribute;
    attributeMapping.type = type;
    attributeMapping.dateFormatBlock = dateFormatBlock;
    
    [self addAttributeMappingToFormMapping:attributeMapping];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapAttribute:(NSString *)attribute
               title:(NSString *)title
                type:(BKFormAttributeMappingType)type
     dateFormat:(NSString *)dateFormat {
    
    BKFormAttributeMapping *attributeMapping = [BKFormAttributeMapping attributeMapping];
    attributeMapping.title = title;
    attributeMapping.attribute = attribute;
    attributeMapping.type = type;
    attributeMapping.dateFormat = dateFormat;
    
    [self addAttributeMappingToFormMapping:attributeMapping];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapAttribute:(NSString *)attribute
               title:(NSString *)title
   selectValuesBlock:(BKFormMappingSelectValueBlock)selectValueBlock
valueFromSelectBlock:(BKFormMappingValueFromSelectBlock)valueFromSelectBlock
     labelValueBlock:(BKFormMappingSelectLabelValueBlock)labelValue {
    
    BKFormAttributeMapping *attributeMapping = [BKFormAttributeMapping attributeMapping];
    attributeMapping.title = title;
    attributeMapping.attribute = attribute;
    attributeMapping.selectValuesBlock = selectValueBlock;
    attributeMapping.type = BKFormAttributeMappingTypeSelect;
    attributeMapping.valueFromSelectBlock = valueFromSelectBlock;
    attributeMapping.labelValueBlock = labelValue;
    
    [self addAttributeMappingToFormMapping:attributeMapping];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)button:(NSString *)title
    identifier:(NSString *)identifier
       handler:(BKFormMappingButtonHandlerBlock)blockHandler
  accesoryType:(UITableViewCellAccessoryType)accesoryType; {
    
    BKFormAttributeMapping *attributeMapping = [BKFormAttributeMapping attributeMapping];
    attributeMapping.title = title;
    attributeMapping.attribute = identifier;
    attributeMapping.btnHandler = blockHandler;
    attributeMapping.accesoryType = accesoryType;
    attributeMapping.type = BKFormAttributeMappingTypeButton;
    
    [self addAttributeMappingToFormMapping:attributeMapping];
    self.saveAttribute = attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)buttonSave:(NSString *)title handler:(BKBasicBlock)blockHandler {
    [self sectiontTitle:@"" identifier:@"saveSection"];
    
    BKFormAttributeMapping *attributeMapping = [BKFormAttributeMapping attributeMapping];
    attributeMapping.title = title;
    attributeMapping.attribute = @"save";
    attributeMapping.saveBtnHandler = blockHandler;
    attributeMapping.type = BKFormAttributeMappingTypeSaveButton;
    
    [self addAttributeMappingToFormMapping:attributeMapping];
    self.saveAttribute = attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)sectiontTitle:(NSString *)title identifier:(NSString *)identifier {
    [_sectionTitles setObject:(nil == title ? @"" : title) forKey:identifier];
    [self addFieldToOrdersArray:identifier];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Getters and setters


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSDictionary *)attributeMappings {
    return _attributeMappings;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSDictionary *)sectionTitles {
    return _sectionTitles;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)addFieldToOrdersArray:(NSString *)identifier {
    if ([self.fieldsOrder isKindOfClass:[NSMutableArray class]]) {
        [(NSMutableArray *)self.fieldsOrder addObject:identifier];
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)addAttributeMappingToFormMapping:(BKFormAttributeMapping *)attributeMapping {
    [_attributeMappings setObject:attributeMapping forKey:attributeMapping.attribute];
    [self addFieldToOrdersArray:attributeMapping.attribute];
}


@end
