//
//  WillDisplayCellExampleViewController.m
//  CellMappingExample
//
//  Created by Bruno Wernimont on 28/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WillDisplayCellExampleViewController.h"

#import "BaseKitCellMapping.h"
#import "Item.h"

@implementation WillDisplayCellExampleViewController

@synthesize tableModel = _tableModel;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Will display cell";
    
    self.tableModel = [BKListTableModel tableModelForTableView:self.tableView];
    self.tableView.dataSource = self.tableModel;
    self.tableView.delegate = self.tableModel;
    
    [BKCellMapping mappingForObjectClass:[Item class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        
        [cellMapping willDisplayCellWithBlock:^(UITableViewCell *cell, id object, NSIndexPath *indexPath) {
            NSLog(@"Will display cell");
        }];
                
        [self.tableModel registerMapping:cellMapping];
    }];
    
    NSArray *items = [NSArray arrayWithObjects:
                      [Item itemWithTitle:@"Book1" subtitle:nil],
                      [Item itemWithTitle:@"Book2" subtitle:nil],
                      [Item itemWithTitle:@"Book3" subtitle:nil],
                      [Item itemWithTitle:@"Book4" subtitle:nil],
                      [Item itemWithTitle:@"Book5" subtitle:nil],
                      [Item itemWithTitle:@"Book6" subtitle:nil],
                      nil];
    
    [self.tableModel loadTableItems:items];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
}


@end
