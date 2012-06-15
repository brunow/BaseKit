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

#import <Foundation/Foundation.h>

#import "BKFormAttributeMapping.h"
#import "BKBlocks.h"

@interface BKFormMapping : NSObject {
    NSMutableDictionary *_attributeMappings;
    NSMutableDictionary *_sectionTitles;
    BKFormAttributeMapping *_saveAttribute;
}

@property (nonatomic, assign) Class objectClass;
@property (nonatomic, readonly) NSDictionary *attributeMappings;
@property (nonatomic, readonly) NSDictionary *sectionTitles;
@property (nonatomic, retain) NSArray *fieldsOrder;
@property (nonatomic, retain) BKFormAttributeMapping *saveAttribute;

- (id)initWithObjectClass:(Class)objectClass;

+ (id)mappingForClass:(Class)objectClass block:(void(^)(BKFormMapping *formMapping))block;

- (void)mapAttribute:(NSString *)attribute title:(NSString *)title;

- (void)mapAttribute:(NSString *)attribute
               title:(NSString *)title
     placeholderText:(NSString *)placeholderText
                type:(BKFormAttributeMappingType)type;

- (void)mapAttribute:(NSString *)attribute
               title:(NSString *)title
                type:(BKFormAttributeMappingType)type;

- (void)mapAttribute:(NSString *)attribute
               title:(NSString *)title
                type:(BKFormAttributeMappingType)type
     controllerClass:(Class)controllerClass;

- (void)mapAttribute:(NSString *)attribute
               title:(NSString *)title
                type:(BKFormAttributeMappingType)type
     dateFormatBlock:(BKFormMappingDateFormatBlock)dateFormatBlock;

- (void)mapAttribute:(NSString *)attribute
               title:(NSString *)title
                type:(BKFormAttributeMappingType)type
          dateFormat:(NSString *)dateFormat;

- (void)mapAttribute:(NSString *)attribute
               title:(NSString *)title
   selectValuesBlock:(BKFormMappingSelectValueBlock)selectValueBlock
valueFromSelectBlock:(BKFormMappingValueFromSelectBlock)valueFromSelectBlock
     labelValueBlock:(BKFormMappingSelectLabelValueBlock)labelValue;

- (void)mapCustomCell:(Class)cell
           identifier:(NSString *)identifier
            rowHeight:(CGFloat)rowHeight
 willDisplayCellBlock:(BKFormMappingWillDisplayCellBlock)willDisplayCellBlock
       didSelectBlock:(BKFormMappingCellSelectionBlock)selectionBlock;

- (void)sectiontTitle:(NSString *)title identifier:(NSString *)identifier;

- (void)button:(NSString *)title
    identifier:(NSString *)identifier
       handler:(BKFormMappingButtonHandlerBlock)blockHandler
  accesoryType:(UITableViewCellAccessoryType)accesoryType;

- (void)buttonSave:(NSString *)title handler:(BKBasicBlock)blockHandler;

@end
