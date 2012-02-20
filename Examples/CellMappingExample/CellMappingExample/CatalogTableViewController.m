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
#import "NibCellTableViewController.h"
#import "SimpleMappingTableViewController.h"
#import "CustomRowHeightTableViewController.h"

#define DYNAMIC_MAPPING @"DynamicMappingTableViewController"
#define NIB_CELL @"NibCellTableViewController"
#define SIMPLE_MAPPING @"SimpleMappingTableViewController"
#define CUSTOM_ROW_HEIGHT @"CustomRowHeightTableViewController"

@implementation CatalogTableViewController

@synthesize tableModel = _tableModel;
@synthesize items = _items;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Catalog";
    
    self.tableModel = [BKTableModel tableModelForTableView:self.tableView];
    
    [self.tableModel objectForRowAtIndexPathWithBlock:^id(NSIndexPath *indexPath) {
        return [self.items objectAtIndex:indexPath.row];
    }];
    
    self.items = [NSArray arrayWithObjects:
                  [Item itemWithTitle:@"Simple mapping" subtitle:nil type:SIMPLE_MAPPING],
                  [Item itemWithTitle:@"Nib cell example" subtitle:nil type:NIB_CELL],
                  [Item itemWithTitle:@"Dynamic Mapping example" subtitle:nil type:DYNAMIC_MAPPING],
                  [Item itemWithTitle:@"Custom row height example" subtitle:nil type:CUSTOM_ROW_HEIGHT],
                  nil];
    
    [BKCellMapping mappingForObjectClass:[Item class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        
        [cellMapping onSelectRowWithBlock:^(UITableViewCell *cell, Item *item, NSIndexPath *indexPath) {
            UIViewController *vc = [[[NSClassFromString(item.type) alloc] init] autorelease];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        
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
#pragma mark - Table view delegate


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableModel didSelectRowAtIndexPath:indexPath];
}


@end
