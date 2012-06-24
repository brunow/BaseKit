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

@class BKCellMapping;

@interface BKTableModel : NSObject <UITableViewDataSource, UITableViewDelegate> {
    NSMutableDictionary *_objectMappings;
    dispatch_queue_t _concurrentQueue;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) BKObjectForRowAtIndexPathBlock objectForRowAtIndexPathBlock;
@property (nonatomic, readonly) NSMutableDictionary *objectMappings;

/**
 Convienent method to initWithTableView:
 @see initWithTableView
 */
+ (id)tableModelForTableView:(UITableView *)tableView;

/**
 Initialize table model
 @param instance of tableView
 @return table model instance
 */
- (id)initWithTableView:(UITableView *)tableView;

/**
 Return UITableViewCell instance with data mapped
 @param indexPath from the cell
 @return UITableViewCell instance
 */
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 Register mapping
 @param Instance of cellMapping
 */
- (void)registerMapping:(BKCellMapping *)cellMapping;


/**
 Must be called whether tableView:didSelectRowAtIndexPath: is fired
 If didSelect block is defined in the cell mapping then the block will be fired
 @param indexPath of row
 */
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 Must be called whether tableView:heightForRowAtIndexPath: is fired
 If didSelect block is defined in the cell mapping then the block will be fired
 @param indexPath of row
 */
- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 Must be called whether tableView:willDisplayCell:forRowAtIndexPath: is fired
 If didSelect block is defined in the cell mapping then the block will be fired
 @params cell that will be displayed and indexPath of cell
 */
- (void)willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 Must be called whether tableView:commitEditingStyle:forRowAtIndexPath: is fired
 If didSelect block is defined in the cell mapping then the block will be fired
 @params UITableViewCellEditingStyle and indexPath of cell 
 */
- (void)commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
         forRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 Block that return object with a given indexPath
 @return Return an object for indexPath used to populate the cell
 */
- (void)objectForRowAtIndexPathWithBlock:(BKObjectForRowAtIndexPathBlock)block;

/**
 @return object for indexPath
 */
- (id)objectForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 Reload items
 */
- (void)loadItems;

@end
