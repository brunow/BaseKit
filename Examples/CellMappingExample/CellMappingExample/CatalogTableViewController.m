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
#import "CustomDataSourceAndDelegateTableViewController.h"

#define DYNAMIC_MAPPING @"DynamicMappingTableViewController"
#define NIB_CELL @"NibCellTableViewController"
#define SIMPLE_MAPPING @"SimpleMappingTableViewController"
#define CUSTOM_ROW_HEIGHT @"CustomRowHeightTableViewController"
#define CUSTOM_DATASOURCE_AND_DELEGATE @"CustomDataSourceAndDelegateTableViewController"

@implementation CatalogTableViewController

@synthesize tableModel = _tableModel;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Catalog";
    
    self.tableModel = [BKTableModel tableModelForTableView:self.tableView];
    self.tableView.dataSource = self.tableModel;
    self.tableView.delegate = self.tableModel;
    
    [BKCellMapping mappingForObjectClass:[Item class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        
        [cellMapping onSelectRowWithBlock:^(UITableViewCell *cell, Item *item, NSIndexPath *indexPath) {
            UIViewController *vc = [[[NSClassFromString(item.type) alloc] init] autorelease];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        [self.tableModel registerMapping:cellMapping];
    }];
    
    NSArray *items = [NSArray arrayWithObjects:
                      [Item itemWithTitle:@"Simple mapping" subtitle:nil type:SIMPLE_MAPPING],
                      [Item itemWithTitle:@"Nib cell example" subtitle:nil type:NIB_CELL],
                      [Item itemWithTitle:@"Dynamic Mapping example" subtitle:nil type:DYNAMIC_MAPPING],
                      [Item itemWithTitle:@"Custom row height example" subtitle:nil type:CUSTOM_ROW_HEIGHT],
                      [Item itemWithTitle:@"Custom dataSource and delegate" subtitle:nil type:CUSTOM_DATASOURCE_AND_DELEGATE],
                      nil];
    
    [self.tableModel loadTableItems:items];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
}


@end
