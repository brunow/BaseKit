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

#import "BKCellMapping.h"

#import "BKTableModel.h"
#import "BKCellAttributeMapping.h"
#import "BKCellAttributeMapping.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BKCellMapping ()

- (void)addAttributeMappingToObjectMapping:(BKCellAttributeMapping *)attributeMapping;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BKCellMapping

@synthesize objectClass = _objectClass;
@synthesize attributeMappings = _attributeMappings;
@synthesize cellClass = _cellClass;
@synthesize nib = _nib;
@synthesize onSelectRowBlock = _onSelectRowBlock;
@synthesize rowHeight = _rowHeight;
@synthesize rowHeightBlock = _rowHeightBlock;
@synthesize willDisplayCellBlock = _willDisplayCellBlock;
@synthesize commitEditingStyleBlock = _commitEditingStyleBlock;
@synthesize editingStyleBlock = _editingStyleBlock;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
    self = [super init];
    
    if (self) {
        _attributeMappings = [[NSMutableDictionary alloc] init];
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
+ (id)mappingForObjectClass:(Class)objectClass block:(void(^)(BKCellMapping *cellMapping))block {
    BKCellMapping *cellMapping = [[self alloc] initWithObjectClass:objectClass];
    block(cellMapping);
    return cellMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapKeyPath:(NSString *)keyPath
       toAttribute:(NSString *)attribute
        valueBlock:(BKCellValueBlock)valueBlock {
    
    BKCellAttributeMapping *attributeMapping = [BKCellAttributeMapping attributeMapping];
    attributeMapping.mappingType = BKCellAttributeMappingTypeDefault;
    attributeMapping.keyPath = keyPath;
    attributeMapping.attribute = attribute;
    attributeMapping.valueBlock = valueBlock;
    
    [self addAttributeMappingToObjectMapping:attributeMapping];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapKeyPath:(NSString *)keyPath
           toAttribute:(NSString *)attribute
        objectBlock:(BKCellObjectBlock)objectBlock {
    
    BKCellAttributeMapping *attributeMapping = [BKCellAttributeMapping attributeMapping];
    attributeMapping.mappingType = BKCellAttributeMappingTypeDefault;
    attributeMapping.keyPath = keyPath;
    attributeMapping.attribute = attribute;
    attributeMapping.objectBlock = objectBlock;
    
    [self addAttributeMappingToObjectMapping:attributeMapping];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapKeyPath:(NSString *)keyPath toAttribute:(NSString *)attribute {
    [self mapKeyPath:keyPath toAttribute:attribute valueBlock:nil];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapObjectToCellClass:(Class)cellClass {
    self.cellClass = cellClass;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)rowHeightWithBlock:(BKCellRowHeightBlock)rowHeightBlock {
    self.rowHeightBlock = rowHeightBlock;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)onSelectRowWithBlock:(BKTableViewCellSelectionBlock)onSelectRowBlock {
    self.onSelectRowBlock = onSelectRowBlock;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)willDisplayCellWithBlock:(BKTableViewCellWillDisplayCellBlock)willDisplayCellBlock {
    self.willDisplayCellBlock = willDisplayCellBlock;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)commitEditingStyleWithBlock:(BKTableViewCommitEditingStyleBlock)commitEditingStyleBlock {
    self.commitEditingStyleBlock = commitEditingStyleBlock;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)editingStyleWithBlock:(BKTableViewEditingStyleBlock)editingStyleBlock {
    self.editingStyleBlock = editingStyleBlock;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)configureMappingsWithTableModel:(BKTableModel *)tableModel object:(id)object {
    
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)addAttributeMappingToObjectMapping:(BKCellAttributeMapping *)attributeMapping {
    [self.attributeMappings setObject:attributeMapping forKey:attributeMapping.keyPath];
}


@end
