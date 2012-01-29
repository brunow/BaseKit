//
//  BKAttributeMappingTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 2/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
    self.tableModel = [BKTableModel tableModelForTableView:tableView delegate:nil];
    
    self.cellMapping = [BKCellMapping mappingForObjectClass:[ObjectTest class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"fullName" toAttribute:@"textLabel.text"];
        [cellMapping mapKeyPath:@"oneLabel" toAttribute:@"textLabel.text"];
        [cellMapping mapKeyPath:@"oneImageView" toAttribute:@"uiimageview" valueBlock:^id(NSString *value) {
            return [UIImage imageNamed:value];
        }];
        [cellMapping mapObjectToCellClass:[CustomCellTest class]];
        [self.tableModel registerMapping:cellMapping];
    }];    
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldTableViewNotBeNil {
    GHAssertNotNil(self.tableModel.tableView, nil);
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
