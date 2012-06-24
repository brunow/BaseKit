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
#import <CoreData/CoreData.h>

#import "BKTableModel.h"

typedef NSFetchedResultsController*(^BKManagedTableModelFetchedResultsControllerBlock)();

/**
 The BKManagedTableModel creates a class that manage tableView with a NSFetchedResultsController.
 */
@interface BKManagedTableModel : BKTableModel<NSFetchedResultsControllerDelegate>

/**
 FetchedResultsController property that will be used to construct the tableView
 */
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

/**
 Create the FetchedResultsController with block syntax.
 @return you must return a FetchedResultsController instance
 */
- (void)setFetchedResultsControllerWithBlock:(BKManagedTableModelFetchedResultsControllerBlock)block;

@end
