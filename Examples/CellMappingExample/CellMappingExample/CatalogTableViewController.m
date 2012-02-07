//
//  FirstTableViewExample.m
//  CellMappingExample
//
//  Created by Bruno Wernimont on 7/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CatalogTableViewController.h"

#import "BaseKitCellMapping.h"
#import "Item.h"
#import "DynamicMappingTableViewController.h"

#define DYNAMIC_MAPPING @"dynamic mapping"

@implementation CatalogTableViewController

@synthesize tableModel = _tableModel;
@synthesize items = _items;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Catalog";
    
    self.tableModel = [BKTableModel tableModelForTableView:self.tableView delegate:self];
    
    self.items = [NSArray arrayWithObjects:
                  [Item itemWithTitle:@"Dynamic Mapping example" subtitle:nil type:DYNAMIC_MAPPING],
                  nil];
    
    [BKCellMapping mappingForObjectClass:[Item class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        
        cellMapping.onSelectRow = ^(UITableViewCell *cell, Item *item, NSIndexPath *indexPath) {
            if ([item.type isEqualToString:DYNAMIC_MAPPING]) {
                DynamicMappingTableViewController *vc = [[[DynamicMappingTableViewController alloc] init] autorelease];
                [self.navigationController pushViewController:vc animated:YES];
            }
        };
        
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        [self.tableModel registerMapping:cellMapping];
    }];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
    self.items = nil;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Table view data source


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.tableModel cellForRowAtIndexPath:indexPath];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - BKTableModelDataSource


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)tableModel:(BKTableModel *)tableModel objectForRowAtIndexPAth:(NSIndexPath *)indexPath {
    return [self.items objectAtIndex:indexPath.row];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Table view delegate


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableModel didSelectRowAtIndexPath:indexPath];
}


@end
