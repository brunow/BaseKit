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


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    [_attributeMappings release];
    
    self.nib = nil;
    
    [super dealloc];
}


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
    
    return [cellMapping autorelease];
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
- (void)mapKeyPath:(NSString *)keyPath toAttribute:(NSString *)attribute {
    [self mapKeyPath:keyPath toAttribute:attribute valueBlock:nil];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapKeyPath:(NSString *)keyPath
           toLabel:(NSString *)attribute
        valueBlock:(BKCellValueBlock)valueBlock {
    
    [self mapKeyPath:keyPath
         toAttribute:[NSString stringWithFormat:@"%@.text", attribute]
          valueBlock:valueBlock];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapObjectToCellClass:(Class)cellClass {
    self.cellClass = cellClass;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)addAttributeMappingToObjectMapping:(BKCellAttributeMapping *)attributeMapping {
    [self.attributeMappings setObject:attributeMapping forKey:attributeMapping.keyPath];
}


@end
