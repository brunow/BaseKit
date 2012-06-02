//
//  BKTableModelManagedListDataController.h
//  CellMappingExample
//
//  Created by Bruno Wernimont on 31/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "BKTableModel.h"

typedef NSFetchedResultsController*(^BKManagedTableModelFetchedResultsControllerBlock)();

@interface BKManagedTableModel : BKTableModel<NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (void)setFetchedResultsControllerWithBlock:(BKManagedTableModelFetchedResultsControllerBlock)block;

@end
