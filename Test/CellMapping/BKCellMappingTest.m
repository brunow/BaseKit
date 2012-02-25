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

@interface BKCellMappingTest : GHTestCase

@property (nonatomic, retain) BKCellMapping *cellMapping;
@property (nonatomic, retain) BKTableModel *tableModel;

@end

@implementation BKCellMappingTest

@synthesize cellMapping = _cellMapping;
@synthesize tableModel = _tableModel;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    self.cellMapping = nil;
    self.tableModel = nil;
    
    [super dealloc];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)shouldRunOnMainThread {
    return YES;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setUpClass {
    UITableView *tableView = [[[UITableView alloc] initWithFrame:CGRectZero] autorelease];
    self.tableModel = [BKTableModel tableModelForTableView:tableView];
    
    self.cellMapping = [BKCellMapping mappingForObjectClass:[ObjectTest class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"fullName" toAttribute:@"textLabel.text"];
        [cellMapping mapKeyPath:@"oneLabel" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[CustomCellTest class]];
        [self.tableModel registerMapping:cellMapping];
    }];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldCellMappingHaveTwoAttributeMapping {
    GHAssertTrue(self.cellMapping.attributeMappings.count == 2, nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldCellObjectBeCorrectClassType {
    GHAssertEquals(self.cellMapping.objectClass, [ObjectTest class], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldCellViewBeCorrectClassType {
    GHAssertEquals(self.cellMapping.cellClass, [CustomCellTest class], nil);
}


@end
