//
//  SimpleMappingTableViewController.m
//  CellMappingExample
//
//  Created by Bruno Wernimont on 7/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SimpleMappingTableViewController.h"

#import "BaseKitCellMapping.h"
#import "Item.h"

@implementation SimpleMappingTableViewController

@synthesize tableModel = _tableModel;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Simple mapping";
    
    self.tableModel = [BKListTableModel tableModelForTableView:self.tableView];
    self.tableView.dataSource = self.tableModel;
    self.tableView.delegate = self.tableModel;
    
    [BKCellMapping mappingForObjectClass:[Item class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        [self.tableModel registerMapping:cellMapping];
    }];
    
    NSArray *items = [NSArray arrayWithObjects:
                      [Item itemWithTitle:@"Book1" subtitle:nil],
                      [Item itemWithTitle:@"Book1" subtitle:nil],
                      [Item itemWithTitle:@"Book1" subtitle:nil],
                      [Item itemWithTitle:@"Book1" subtitle:nil],
                      [Item itemWithTitle:@"Book1" subtitle:nil],
                      [Item itemWithTitle:@"Book1" subtitle:nil],
                      nil];
    
    [self.tableModel loadTableItems:items];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
}


@end
