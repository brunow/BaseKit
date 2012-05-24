//
//  FormFieldExampleTableViewController.m
//  FormFieldExample
//
//  Created by Bruno Wernimont on 23/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FormFieldExampleTableViewController.h"

#import "BaseKitFormField.h"
#import "BaseKitViewAdditions.h"

@interface FormFieldExampleTableViewController ()

@end

@implementation FormFieldExampleTableViewController

- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    NSUInteger row = indexPath.row;
    
    if (0 == row) {
        cell = [BKLabelField cellForTableView:self.tableView];
        cell.detailTextLabel.text = @"detail";
    } else if (1 == row) {
        cell = [BKSwitchField cellForTableView:self.tableView];
    } else if (2 == row) {
        cell = [BKTextField cellForTableView:self.tableView];
        [(BKTextField *)cell textField].text = @"change me";
    } else if (3 == row) {
        cell = [BKPasswordTextField cellForTableView:self.tableView];
        [(BKPasswordTextField *)cell textField].text = @"password";
    } else if (4 == row) {
        cell = [BKSliderField cellForTableView:self.tableView];
        [[(BKSliderField *)cell slider] setValue:10 animated:NO];
    } else if (5 == row) {
        cell = [BKFloatField cellForTableView:self.tableView];
        cell.detailTextLabel.text = @"10.5";
    } else if (6 == row) {
        cell = [BKIntegerField cellForTableView:self.tableView];
        cell.detailTextLabel.text = @"10";
    }
    
    if (nil == cell) {
        cell = [BKLabelField cellForTableView:self.tableView];
    }
    
    cell.textLabel.text = NSStringFromClass([cell class]);
    
    return cell;
}

@end
