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
#import "BaseKitFormField.h"
#import "BKFormSectionObject.h"


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BKFormMapping ()

- (void)addFieldToOrdersArray:(NSString *)identifier;

- (void)addAttributeMappingToFormMapping:(BKFormAttributeMapping *)attributeMapping;

- (BKFormAttributeMapping *)attributeMappingWithTitle:(NSString *)title
                                            attribute:(NSString *)attribute
                                                 type:(BKFormAttributeMappingType)type;


@end


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BKFormMapping

@synthesize objectClass = _objectClass;
@synthesize fieldsOrder = _fieldsOrder;
@synthesize saveAttribute = _saveAttribute;
@synthesize textFieldClass = _textFieldClass;
@synthesize floatFieldClass = _floatFieldClass;
@synthesize integerFieldClass = _integerFieldClass;
@synthesize labelFieldClass = _labelFieldClass;
@synthesize passwordFieldClass = _passwordFieldClass;
@synthesize switchFieldClass = _switchFieldClass;
@synthesize saveButtonFieldClass = _saveButtonFieldClass;
@synthesize bigTextFieldClass = _bigTextFieldClass;
@synthesize sliderFieldClass = _sliderFieldClass;
@synthesize buttonFieldClass = _buttonFieldClass;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
    self = [super init];
    if (self) {
        _attributeMappings = [[NSMutableDictionary alloc] init];
        _sectionTitles = [[NSMutableDictionary alloc] init];
        _fieldsOrder = [[NSMutableArray alloc] init];
        _textFieldClass = [BKTextField class];
        _floatFieldClass = [BKFloatField class];
        _integerFieldClass = [BKIntegerField class];
        _labelFieldClass = [BKLabelField class];
        _passwordFieldClass = [BKPasswordTextField class];
        _switchFieldClass = [BKSwitchField class];
        _saveButtonFieldClass = [BKSaveButtonField class];
        _bigTextFieldClass = [BKBigTextField class];
        _sliderFieldClass = [BKSliderField class];
        _buttonFieldClass = [BKButtonField class];
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
    return formMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)mapAttribute:(NSString *)attribute title:(NSString *)title {
    return [self mapAttribute:attribute title:title type:BKFormAttributeMappingTypeDefault];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)mapAttribute:(NSString *)attribute
                                   title:(NSString *)title
                                    type:(BKFormAttributeMappingType)type {
    
    return [self mapAttribute:attribute title:title type:type controllerClass:nil];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)mapAttribute:(NSString *)attribute
                                   title:(NSString *)title
                         placeholderText:(NSString *)placeholderText
                                    type:(BKFormAttributeMappingType)type {
    
    BKFormAttributeMapping *attributeMapping = [self attributeMappingWithTitle:title
                                                                     attribute:attribute
                                                                          type:type];
    
    attributeMapping.placeholderText = placeholderText;
    
    return attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)mapAttribute:(NSString *)attribute
                                   title:(NSString *)title
                                    type:(BKFormAttributeMappingType)type
                         controllerClass:(Class)controllerClass {
    
    BKFormAttributeMapping *attributeMapping = [self attributeMappingWithTitle:title
                                                                     attribute:attribute
                                                                          type:type];
    
    attributeMapping.controllerClass = controllerClass;
    
    return attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)mapAttribute:(NSString *)attribute
                                   title:(NSString *)title
                                    type:(BKFormAttributeMappingType)type
                                minValue:(float)minValue
                                maxValue:(float)maxValue {
    
    BKFormAttributeMapping *attributeMapping = [self attributeMappingWithTitle:title
                                                                     attribute:attribute
                                                                          type:type];
    
    attributeMapping.minValue = minValue;
    attributeMapping.maxValue = maxValue;
    
    return attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)mapAttribute:(NSString *)attribute
                                   title:(NSString *)title
                                    type:(BKFormAttributeMappingType)type
                         dateFormatBlock:(BKFormMappingDateFormatBlock)dateFormatBlock {
    
    BKFormAttributeMapping *attributeMapping = [self attributeMappingWithTitle:title
                                                                     attribute:attribute
                                                                          type:type];
    
    attributeMapping.dateFormatBlock = dateFormatBlock;
    
    return attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)mapAttribute:(NSString *)attribute
                                   title:(NSString *)title
                                    type:(BKFormAttributeMappingType)type
                              dateFormat:(NSString *)dateFormat {
    
    BKFormAttributeMapping *attributeMapping = [self attributeMappingWithTitle:title
                                                                     attribute:attribute
                                                                          type:type];
    
    attributeMapping.dateFormat = dateFormat;
    
    return attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)mapAttribute:(NSString *)attribute
                                   title:(NSString *)title
                            showInPicker:(BOOL)showInPicker
                       selectValuesBlock:(BKFormMappingSelectValueBlock)selectValueBlock
                    valueFromSelectBlock:(BKFormMappingValueFromSelectBlock)valueFromSelectBlock
                         labelValueBlock:(BKFormMappingSelectLabelValueBlock)labelValue {
    
    BKFormAttributeMapping *attributeMapping = [self attributeMappingWithTitle:title
                                                                     attribute:attribute
                                                                          type:BKFormAttributeMappingTypeSelect];
    
    attributeMapping.selectValuesBlock = selectValueBlock;
    attributeMapping.valueFromSelectBlock = valueFromSelectBlock;
    attributeMapping.labelValueBlock = labelValue;
    attributeMapping.showInPicker = showInPicker;
    
    return attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)mapCustomCell:(Class)cell
                               identifier:(NSString *)identifier
                     willDisplayCellBlock:(BKFormMappingWillDisplayCellBlock)willDisplayCellBlock
                           didSelectBlock:(BKFormMappingCellSelectionBlock)selectionBlock {
    
    return [self mapCustomCell:cell
                    identifier:identifier
                     rowHeight:0
          willDisplayCellBlock:willDisplayCellBlock
                didSelectBlock:selectionBlock];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)mapCustomCell:(Class)cell
                               identifier:(NSString *)identifier
                                rowHeight:(CGFloat)rowHeight
                     willDisplayCellBlock:(BKFormMappingWillDisplayCellBlock)willDisplayCellBlock
                           didSelectBlock:(BKFormMappingCellSelectionBlock)selectionBlock {
    
    BKFormAttributeMapping *attributeMapping = [self attributeMappingWithTitle:nil
                                                                     attribute:identifier
                                                                          type:BKFormAttributeMappingTypeCustomCell];
    
    attributeMapping.willDisplayCellBlock = willDisplayCellBlock;;
    attributeMapping.cellSelectionBlock = selectionBlock;
    attributeMapping.customCell = cell;
    attributeMapping.rowHeight = rowHeight;
    
    return attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)button:(NSString *)title
                        identifier:(NSString *)identifier
                           handler:(BKFormMappingButtonHandlerBlock)blockHandler
                      accesoryType:(UITableViewCellAccessoryType)accesoryType; {
    
    BKFormAttributeMapping *attributeMapping = [self attributeMappingWithTitle:title
                                                                     attribute:identifier
                                                                          type:BKFormAttributeMappingTypeButton];
    
    attributeMapping.btnHandler = blockHandler;
    attributeMapping.accesoryType = accesoryType;
    self.saveAttribute = attributeMapping;
    
    return attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKFormAttributeMapping *)buttonSave:(NSString *)title handler:(BKBasicBlock)blockHandler {
    [self sectiontTitle:@"" identifier:@"saveSection"];
    
    BKFormAttributeMapping *attributeMapping = [self attributeMappingWithTitle:title
                                                                     attribute:@"save"
                                                                          type:BKFormAttributeMappingTypeSaveButton];
    
    attributeMapping.saveBtnHandler = blockHandler;    
    self.saveAttribute = attributeMapping;
    
    return attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)sectiontTitle:(NSString *)title identifier:(NSString *)identifier {
    [self sectiontTitle:title footer:nil identifier:identifier];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)sectiontTitle:(NSString *)title footer:(NSString *)footer identifier:(NSString *)identifier {
    BKFormSectionObject *section = [BKFormSectionObject sectionWithHeaderTitle:(title ? title : @"") footerTitle:footer];
    [_sectionTitles setObject:section forKey:identifier];
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
- (BKFormAttributeMapping *)attributeMappingWithTitle:(NSString *)title
                                            attribute:(NSString *)attribute
                                                 type:(BKFormAttributeMappingType)type {
    
    BKFormAttributeMapping *attributeMapping = [BKFormAttributeMapping attributeMapping];
    attributeMapping.title = title;
    attributeMapping.attribute = attribute;
    attributeMapping.type = type;
    [self addAttributeMappingToFormMapping:attributeMapping];
    
    return attributeMapping;
}


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
