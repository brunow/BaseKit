//
//  CustomRowHeightTableViewController.m
//  CellMappingExample
//
//  Created by Bruno Wernimont on 8/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomRowHeightTableViewController.h"

#import "BaseKitCellMapping.h"

#import "Item.h"

@implementation CustomRowHeightTableViewController

@synthesize tableModel = _tableModel;
@synthesize items = _items;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Simple mapping";
    
    self.items = [NSArray arrayWithObjects:
                  [Item itemWithTitle:@"Book1" subtitle:nil],
                  [Item itemWithTitle:@"Book1" subtitle:nil],
                  [Item itemWithTitle:@"Book1" subtitle:nil],
                  [Item itemWithTitle:@"Book1" subtitle:nil],
                  [Item itemWithTitle:@"Book1" subtitle:nil],
                  [Item itemWithTitle:@"Book1" subtitle:nil],
                  nil];
    
    self.tableModel = [BKTableModel tableModelForTableView:self.tableView delegate:self];
    
    [BKCellMapping mappingForObjectClass:[Item class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        
        //cellMapping.rowHeight = 150;
        cellMapping.rowHeightBlock = ^CGFloat(UITableViewCell *cell, id object, NSIndexPath *indexPath) {
            return 150;
        };
        
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.tableModel heightForRowAtIndexPath:indexPath];
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
}


@end
