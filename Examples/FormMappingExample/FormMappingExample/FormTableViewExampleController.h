//
//  FormTableViewController.h
//  FormMappingExample
//
//  Created by Bruno Wernimont on 11/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BKFormModel;
@class Movie;

@interface FormTableViewExampleController : UITableViewController

@property (nonatomic, strong) BKFormModel *formModel;
@property (nonatomic, strong) Movie *movie;

@end
