BaseKit is a set of IOS class to make your life easier.

# Installation

You have two way to do that

* Copying files.
* Install using CocoaPods.

## Copying files

Add Code dir or pick library that you need inside Code/*.

## Install using CocoaPods.

    dependency 'BaseKit/Core', '~> 0.1'
    dependency 'BaseKit/View', '~> 0.1'
    dependency 'BaseKit/CellMapping', '~> 0.1'

# Core

Perform operation in background.

	[BKOperationHelper performBlockInBackground:^{
        // Do your operation in background
    } completion:^{
        // Update UI in main queue
    }];

Iteration.

	[BKIteratingHelper iterateTil:4 usingBlock:^(int number) {
        NSLog(@"%d", number);
    }];

# View

Present modal view controller with block.

    [self presentModalViewControllerWithBlock:^UIViewController *{
     	return [[[AnyViewController alloc] init] autorelease];
	} animated:YES];

Push view controller with block.

	[self.navigationController pushViewControllerWithBlock:^UIViewController *{
        return [[[AnyViewController alloc] init] autorelease];
    } animated:YES];

# Cell mapping

	self.tableModel = [BKTableModel tableModelForTableView:self.tableView];
	self.tableView.dataSource = self.tableModel;
	self.tableView.delegate = self.tableModel;

    [BKCellMapping mappingForObjectClass:[Item class] block:^(BKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];

        [cellMapping onSelectRowWithBlock:^(UITableViewCell *cell, Item *item, NSIndexPath *indexPath) {
	           // Do something
        }];

        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        [self.tableModel registerMapping:cellMapping];
    }];

	NSArray *items = [NSArray arrayWithObjects:
                      	[Item itemWithTitle:@"Simple mapping"],
                      	[Item itemWithTitle:@"Nib cell example"],
                        nil];
    
	[self.tableModel loadTableItems:items];

For more **example** open **Examples/CellMappingExample/CellMappingExample.xcodeproj project**.


# ARC Support

BaseKit is fully compatible out of box with both ARC and non-ARC project.


# App using BaseKit

If you use BaseKit I'll be happy to add your app name here.

[LiègeExpo2017](http://itunes.apple.com/fr/app/liege-expo-2017/id505451794?mt=8)

