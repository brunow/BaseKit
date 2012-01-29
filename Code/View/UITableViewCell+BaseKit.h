//
//  UITableViewCell+BaseKit.h
//  BaseKit
//
//  Created by Bruno Wernimont on 1/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (BaseKit)

+ (id)cellForTableView:(UITableView *)tableView;

+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib;

+ (UITableViewCellStyle)cellStyle;

+ (NSString *)cellIdentifier;

+ (UINib *)nib;

+ (NSString *)nibName;

@end
