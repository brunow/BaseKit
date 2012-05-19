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

#import "BKCellMappingBlocks.h"
#import "BKMacrosDefinitions.h"

@class BKTableModel;

@interface BKCellMapping : NSObject

@property (nonatomic, assign) Class objectClass;
@property (nonatomic, assign) Class cellClass;
@property (nonatomic, readonly, strong) NSMutableDictionary *attributeMappings;
@property (nonatomic, strong) UINib *nib;
@property (nonatomic, copy) BKTableViewCellSelectionBlock onSelectRowBlock;
@property (nonatomic, assign) CGFloat rowHeight;
@property (nonatomic, copy) BKCellRowHeightBlock rowHeightBlock;
@property (nonatomic, copy) BKTableViewCellWillDisplayCellBlock willDisplayCellBlock;
@property (nonatomic, copy) BKTableViewCommitEditingStyleBlock commitEditingStyleBlock;
@property (nonatomic, copy) BKTableViewEditingStyleBlock editingStyleBlock;

- (id)initWithObjectClass:(Class)objectClass;

+ (id)mappingForObjectClass:(Class)objectClass block:(void(^)(BKCellMapping *cellMapping))block;

- (void)mapKeyPath:(NSString *)keyPath
       toAttribute:(NSString *)attribute
        valueBlock:(BKCellValueBlock)valueBlock;

- (void)mapKeyPath:(NSString *)keyPath
       toAttribute:(NSString *)attribute
       objectBlock:(BKCellObjectBlock)objectBlock;

- (void)mapKeyPath:(NSString *)keyPath toAttribute:(NSString *)attribute;

- (void)rowHeightWithBlock:(BKCellRowHeightBlock)rowHeightBlock;

- (void)onSelectRowWithBlock:(BKTableViewCellSelectionBlock)onSelectRowBlock;

- (void)willDisplayCellWithBlock:(BKTableViewCellWillDisplayCellBlock)willDisplayCellBlock;

- (void)commitEditingStyleWithBlock:(BKTableViewCommitEditingStyleBlock)commitEditingStyleBlock;

- (void)editingStyleWithBlock:(BKTableViewEditingStyleBlock)editingStyleBlock;

- (void)mapObjectToCellClass:(Class)cellClass;

+ (void)configureMappingsWithTableModel:(BKTableModel *)tableModel object:(id)object;

@end
