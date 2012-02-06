//
//  TableViewControllerExample.m
//  CellMappingExample
//
//  Created by Bruno Wernimont on 5/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableViewControllerExample.h"

#import "BaseKitCellMapping.h"
#import "UITableViewCell+BaseKit.h"

#import "Item.h"
#import "MovieViewCell.h"
#import "BookViewCell.h"

@implementation TableViewControllerExample

@synthesize tableModel = _tableModel;
@synthesize items = _items;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = [NSArray arrayWithObjects:
                  [Item itemWithTitle:@"Movie1" subtitle:@"First movie" type:@"movie"],
                  [Item itemWithTitle:@"Movie2" subtitle:@"Second movie" type:@"movie"],
                  [Item itemWithTitle:@"Book1" subtitle:nil type:@"book"],
                   nil];
    
    self.tableModel = [BKTableModel tableModelForTableView:self.tableView delegate:self];
    
    [BKDynamicCellMapping mappingForObjectClass:[Item class] block:^(BKDynamicCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapKeyPath:@"subtitle" toAttribute:@"detailTextLabel.text"];
        
        [cellMapping mapKeyPath:@"imageName" toAttribute:@"imageView.image" valueBlock:^id(NSString *value) {
            return [UIImage imageNamed:value];
        }];
        
        cellMapping.onSelectRow = ^(UITableViewCell *cell, id object, NSIndexPath* indexPath) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You select a movie cell"
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            
            [alert show];
            [alert release];
        };
        
        [cellMapping mapObjectToCellClass:[MovieViewCell class] whenValueOfKeyPath:@"type" isEqualTo:@"movie"];
        [self.tableModel registerMapping:cellMapping];
    }];
    
    [BKDynamicCellMapping mappingForObjectClass:[Item class] block:^(BKDynamicCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"titleLabel.text"];
        [cellMapping mapObjectToCellClass:[BookViewCell class] whenValueOfKeyPath:@"type" isEqualTo:@"book"];
        cellMapping.nib = [BookViewCell nib];
        [self.tableModel registerMapping:cellMapping];
    }];
    
    // Simple mapping
    /*[BKCellMapping mappingForObjectClass:[Item class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"titleLabel.text"];
        [cellMapping mapObjectToCellClass:[BookViewCell class]];
        cellMapping.nib = [BookViewCell nib];
        [self.tableModel registerMapping:cellMapping];
    }];*/
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
    self.items = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.tableModel cellForRowAtIndexPath:indexPath];
}

#pragma mark - BKTableModelDataSource

- (id)tableModel:(BKTableModel *)tableModel objectForRowAtIndexPAth:(NSIndexPath *)indexPath {
    return [self.items objectAtIndex:indexPath.row];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableModel didSelectRowAtIndexPath:indexPath];
}

@end
