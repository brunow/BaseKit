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

#import <Foundation/Foundation.h>

#import "BKCellMappingBlocks.h"

@class BKCellMapping;

@interface BKTableModel : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, copy) BKObjectForRowAtIndexPathBlock objectForRowAtIndexPathBlock;
@property (nonatomic, retain) NSMutableArray *sectionTitles; // Doesn't work yet with sections !
@property (nonatomic, retain) NSMutableArray *sections; // Doesn't work yet with sections !
@property (nonatomic, retain) NSMutableArray *items;

+ (id)tableModelForTableView:(UITableView *)tableView;

- (id)initWithTableView:(UITableView *)tableView;

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)registerMapping:(BKCellMapping *)cellMapping;

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)objectForRowAtIndexPathWithBlock:(BKObjectForRowAtIndexPathBlock)block;

- (void)loadTableItems:(NSArray *)items;

@end
