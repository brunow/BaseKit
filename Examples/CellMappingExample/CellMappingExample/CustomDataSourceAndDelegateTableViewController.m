//
//  CustomDataSourceAndDelegateTableViewController.m
//  CellMappingExample
//
//  Created by Bruno Wernimont on 26/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomDataSourceAndDelegateTableViewController.h"

#import "BaseKitCellMapping.h"
#import "Item.h"

@implementation CustomDataSourceAndDelegateTableViewController

@synthesize tableModel;
@synthesize items;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Custom dataSource and delegate";
    
    self.tableModel = [BKTableModel tableModelForTableView:self.tableView];
    
    [self.tableModel objectForRowAtIndexPathWithBlock:^id(NSIndexPath *indexPath) {
        return [self.items objectAtIndex:indexPath.row];
    }];
    
    [BKCellMapping mappingForObjectClass:[Item class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        [self.tableModel registerMapping:cellMapping];
    }];
    
    self.items = [NSArray arrayWithObjects:
                  [Item itemWithTitle:@"Title1" subtitle:nil type:nil],
                  [Item itemWithTitle:@"Title2" subtitle:nil type:nil],
                  nil];
    
    [self.tableView reloadData];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
    self.items = nil;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDataSource


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
    UITableViewCell *cell = [self.tableModel cellForRowAtIndexPath:indexPath];
    
    // Customize your cell
    cell.textLabel.textColor = [UIColor redColor];
    
    return cell;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
/* Uncomment if you have different cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.tableModel heightForRowAtIndexPath:indexPath];
}*/


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDelegate


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableModel didSelectRowAtIndexPath:indexPath];
}


@end
