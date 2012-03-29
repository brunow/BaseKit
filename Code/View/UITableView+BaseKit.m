//
//  UITableView+BaseKit.m
//  BaseKit
//
//  Created by Bruno Wernimont on 29/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UITableView+BaseKit.h"


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UITableView (BaseKit)


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)reloadDataAndKeepSelection {
    NSArray *indexPaths = nil;
	
	if ([self respondsToSelector:@selector(indexPathsForSelectedRows)]) {
        indexPaths = [self performSelector:@selector(indexPathsForSelectedRows)];
    } else {
        indexPaths = [NSArray arrayWithObject:[self indexPathForSelectedRow]];
    }
    
	[self reloadData];
    
    [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath *indexPath, NSUInteger idx, BOOL *stop) {
        [self selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }];
}


@end
