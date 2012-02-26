//
//  SimpleMappingTableViewController.h
//  CellMappingExample
//
//  Created by Bruno Wernimont on 7/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BKTableModel;

@interface SimpleMappingTableViewController : UITableViewController

@property (nonatomic, retain) BKTableModel *tableModel;

@end
