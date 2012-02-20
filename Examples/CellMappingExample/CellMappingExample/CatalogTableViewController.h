//
//  FirstTableViewExample.h
//  CellMappingExample
//
//  Created by Bruno Wernimont on 7/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BKTableViewModel;

@interface CatalogTableViewController : UITableViewController

@property (nonatomic, retain) BKTableViewModel *tableModel;
@property (nonatomic, retain) NSArray *items;

@end
