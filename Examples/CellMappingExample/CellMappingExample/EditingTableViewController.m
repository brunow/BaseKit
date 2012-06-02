//
//  EditingTableViewController.m
//  CellMappingExample
//
//  Created by Bruno Wernimont on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EditingTableViewController.h"

#import "BaseKitCellMapping.h"
#import "Item.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation EditingTableViewController

@synthesize tableModel = _tableModel;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Editing table view";
    
    self.tableModel = [BKListTableModel tableModelForTableView:self.tableView];
    self.tableView.dataSource = self.tableModel;
    self.tableView.delegate = self.tableModel;
    
    [BKCellMapping mappingForObjectClass:[Item class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        
        [cellMapping commitEditingStyleWithBlock:^(id object, NSIndexPath *indexPath, UITableViewCellEditingStyle editingStyle) {
            if (editingStyle == UITableViewCellEditingStyleDelete) {
                [self.tableModel.items removeObject:object];
                NSArray *rows = [NSArray arrayWithObjects:indexPath, nil];
                [self.tableView deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationMiddle];
            }
        }];
        
        // Not needed but you can set certain object to UITableViewCellEditingStyleInsert or UITableViewCellEditingStyleNone
        [cellMapping editingStyleWithBlock:^UITableViewCellEditingStyle(id object, NSIndexPath *indexPath) {
            return UITableViewCellEditingStyleDelete;
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
    
    [self.tableView setEditing:YES animated:NO];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
}


@end
