//
//  UITableViewCell+BaseKit.m
//  BaseKit
//
//  Created by Bruno Wernimont on 1/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UITableViewCell+BaseKit.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UITableViewCell (BaseKit)


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)cellForTableView:(UITableView *)tableView { 
    NSString *cellID = [self cellIdentifier]; 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        UITableViewCellStyle cellStyle = [self cellStyle];
        cell = [[[self alloc] initWithStyle:cellStyle reuseIdentifier:cellID] autorelease];
    } 
    
    return cell;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib {
    NSString *cellID = [self cellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
        cell = [nibObjects objectAtIndex:0];
    }
    
    return cell;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (UITableViewCellStyle)cellStyle {
    return UITableViewCellStyleDefault;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (UINib *)nib {
    NSBundle *classBundle = [NSBundle bundleForClass:[self class]];
    NSString *nibName = [self nibName];
    
    return [UINib nibWithNibName:nibName bundle:classBundle];
} 


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString *)nibName {
    return [self cellIdentifier];
}


@end
