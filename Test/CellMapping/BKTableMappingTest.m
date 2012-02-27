//
// Created by Bruno Wernimont on 2012
// Copyright 2012 BaseKit
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "CustomCellTest.h"
#import "ObjectTest.h"

@interface BKTableMappingTest : GHTestCase <UITableViewDataSource>

@property (nonatomic, retain) BKCellAttributeMapping *attributeMapping;
@property (nonatomic, retain) BKTableModel *tableModel;
@property (nonatomic, retain) NSArray *items;

@end

@implementation BKTableMappingTest

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
    /*ObjectTest *object = [[[ObjectTest alloc] init] autorelease];
    
    object.title = @"title";
    object.fullName = @"fullName";
    object.image = nil;
    
    self.items = [NSArray arrayWithObject:object];
    
    UITableView *tableView = [[[UITableView alloc] initWithFrame:CGRectZero] autorelease];
    tableView.dataSource = self;
    self.tableModel = [BKTableModel tableModelForTableView:tableView];
    
    [self.tableModel objectForRowAtIndexPathWithBlock:^id(NSIndexPath *indexPath) {
        return [self.items objectAtIndex:indexPath.row];
    }];
    
    self.attributeMapping = [BKCellMapping mappingForObjectClass:[ObjectTest class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"fullName" toAttribute:@"textLabel.text"];
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[CustomCellTest class]];
        [self.tableModel registerMapping:cellMapping];
    }];*/
    
    NSLog(@"dsdddsdsdsddsdsds");
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadTableViewData {
    // This method is used to force tableView to load data
    [self.tableModel.tableView reloadData];
    NSLog(@"dsdsdsdssd ddfdf---------");
    GHAssertTrue(NO, nil);
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


////////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"----------cellForRowAtIndexPath---------");
    return [self.tableModel cellForRowAtIndexPath:indexPath];
}


@end
