//
//  BKTableModel.m
//  BaseKit
//
//  Created by Bruno Wernimont on 1/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
    
    return [[self alloc] initWithTableView:tableView delegate:delegate];
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
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    __block BKCellMapping *cellMapping = nil;
    __block id object = nil;
    
    dispatch_sync(concurrentQueue, ^{
        object = [self.delegate tableModel:self objectForRowAtIndexPAth:indexPath];
        NSSet *cellMappings = [BKCellMapper cellMappingsForObject:object mappings:self.objectMappings];
        cellMapping = [BKCellMapper cellMappingForObject:object mappings:cellMappings];
    });
    
    UITableViewCell *cell = nil;
    
    if (cellMapping.nib == nil) {
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
    
    if ([self.objectMappings objectForKey:cellMapping] == nil) {
        [self.objectMappings setObject:set forKey:objectClassStringName];
    }
    
    [set addObject:cellMapping];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Setters


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private





@end
