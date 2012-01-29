//
//  BKTableModel.h
//  BaseKit
//
//  Created by Bruno Wernimont on 1/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BKTableModelDataSource.h"

@class BKCellMapping;

@interface BKTableModel : NSObject

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, assign) id<BKTableModelDataSource> delegate;

+ (id)tableModelForTableView:(UITableView *)tableView
                    delegate:(id<BKTableModelDataSource>)delegate;

- (id)initWithTableView:(UITableView *)tableView
               delegate:(id<BKTableModelDataSource>)delegate;

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)registerMapping:(BKCellMapping *)cellMapping;

@end
