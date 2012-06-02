//
//  NSFetchedResultsViewController.h
//  CellMappingExample
//
//  Created by Bruno Wernimont on 31/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BKManagedTableModel;

@interface NSFetchedResultsViewController : UITableViewController

@property (nonatomic, retain) BKManagedTableModel *tableModel;

- (void)addItems;

@end
