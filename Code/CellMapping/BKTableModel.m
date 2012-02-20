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

#import "BKTableModel.h"

#import "UITableViewCell+BaseKit.h"
#import "BKCellAttributeMapping.h"
#import "BKCellMapping.h"
#import "BKCellMapper.h"

#import "UITableViewCell+BaseKit.h"
#import "NSDictionary+BaseKit.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BKTableModel ()
    
@property (nonatomic, readonly) NSMutableDictionary *objectMappings;

- (id)objectForRowAtIndexPath:(NSIndexPath *)indexPath;

- (BKCellMapping *)cellMappingForObject:(id)object;
    
@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BKTableModel

@synthesize tableView = _tableView;
@synthesize objectMappings = _objectMappings;
@synthesize delegate = _delegate;


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)tableModelForTableView:(UITableView *)tableView
                    delegate:(id<BKTableModelDataSource>)delegate {
    
    return [[[self alloc] initWithTableView:tableView delegate:delegate] autorelease];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithTableView:(UITableView *)tableView
               delegate:(id<BKTableModelDataSource>)delegate {
    
    self = [self init];
    
    if (self) {
        _objectMappings = [[NSMutableDictionary alloc] init];
        self.tableView = tableView;
        self.delegate = delegate;
    }
    
    return self;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = [self objectForRowAtIndexPath:indexPath];;
    BKCellMapping *cellMapping = [self cellMappingForObject:object];
    UITableViewCell *cell = nil;
    
    if (nil == cellMapping.nib) {
        cell = [cellMapping.cellClass cellForTableView:self.tableView];
    } else {
        cell = [cellMapping.cellClass cellForTableView:self.tableView fromNib:cellMapping.nib];
    }
    
    [BKCellMapper mapCellAttributeWithMapping:cellMapping object:object cell:cell];
    
    return cell;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)registerMapping:(BKCellMapping *)cellMapping {
    NSString *objectClassStringName = NSStringFromClass(cellMapping.objectClass);
    
    NSMutableSet *set = [self.objectMappings objectForKey:objectClassStringName
                                            defaultObject:[NSMutableSet set]];
    
    if (nil == [self.objectMappings objectForKey:cellMapping]) {
        [self.objectMappings setObject:set forKey:objectClassStringName];
    }
    
    [set addObject:cellMapping];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = [self objectForRowAtIndexPath:indexPath];
    BKCellMapping *cellMapping = [self cellMappingForObject:object];
    
    if (nil != cellMapping.onSelectRowBlock) {
        UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
        cellMapping.onSelectRowBlock(cell, object, indexPath);
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = [self objectForRowAtIndexPath:indexPath];
    BKCellMapping *cellMapping = [self cellMappingForObject:object];
    
    CGFloat rowHeight = 0;
    
    if (nil != cellMapping.rowHeightBlock) {
        rowHeight = cellMapping.rowHeightBlock(object, indexPath);
    } else if (cellMapping.rowHeight > 0) {
        rowHeight = cellMapping.rowHeight;
    } else {
        rowHeight = self.tableView.rowHeight;
    }
    
    return rowHeight;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Setters


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.delegate tableModel:self objectForRowAtIndexPAth:indexPath];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BKCellMapping *)cellMappingForObject:(id)object {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("be.BaseKit.CellMapping.TableModel", NULL);
    __block BKCellMapping *cellMapping = nil;
    
    dispatch_sync(concurrentQueue, ^{
        NSSet *cellMappings = [BKCellMapper cellMappingsForObject:object mappings:self.objectMappings];
        cellMapping = [BKCellMapper cellMappingForObject:object mappings:cellMappings];
    });
    
    return cellMapping;
}


@end
