//
//  BKTableModelListDataController.h
//  CellMappingExample
//
//  Created by Bruno Wernimont on 31/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BKTableModel.h"

@interface BKListTableModel : BKTableModel {
    NSMutableArray *_items;
}

@property (nonatomic, readonly, strong) NSMutableArray *items;

- (void)loadTableItems:(NSArray *)items;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

@end
