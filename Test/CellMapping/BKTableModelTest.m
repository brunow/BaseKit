//
//  BKTableModelTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 2/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomCellTest.h"
#import "ObjectTest.h"

@interface BKTableModelTest : GHTestCase<UITableViewDataSource, BKTableModelDataSource>

@property (nonatomic, retain) BKCellAttributeMapping *attributeMapping;
@property (nonatomic, retain) BKTableModel *tableModel;
@property (nonatomic, retain) NSArray *items;

@end

@implementation BKTableModelTest

@synthesize attributeMapping;
@synthesize tableModel;
@synthesize items;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    self.attributeMapping = nil;
    self.tableModel = nil;
    self.items = nil;
    
    [super dealloc];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)shouldRunOnMainThread {
    return YES;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setUpClass {
    ObjectTest *object = [[[ObjectTest alloc] init] autorelease];
    
    object.title = @"title";
    object.fullName = @"fullName";
    object.image = nil;
    
    self.items = [NSArray arrayWithObject:object];
    
    UITableView *tableView = [[[UITableView alloc] initWithFrame:CGRectZero] autorelease];
    tableView.dataSource = self;
    self.tableModel = [BKTableModel tableModelForTableView:tableView delegate:self];
    
    self.attributeMapping = [BKCellMapping mappingForObjectClass:[ObjectTest class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"fullName" toAttribute:@"textLabel.text"];
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[CustomCellTest class]];
        [self.tableModel registerMapping:cellMapping];
    }];    
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TableView


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.tableModel cellForRowAtIndexPath:indexPath];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark BKTableModelDataSource


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)tableModel:(BKTableModel *)tableModel objectForRowAtIndexPAth:(NSIndexPath *)indexPath {
    return [self.items objectAtIndex:indexPath.row];
}



@end
