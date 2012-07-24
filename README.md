BaseKit is a set of IOS class to make your life easier.

# Installation

You have two way to do that

* Copying files.
* Install using CocoaPods.

## Copying files

Add Code dir or pick library that you need inside Code/*.

## Install using CocoaPods.

    dependency 'BaseKit/Core', '~> 0.2.5'
    dependency 'BaseKit/View', '~> 0.2.5'
    dependency 'BaseKit/CellMapping', '~> 0.2.5'
    dependency 'BaseKit/LocationManager', '~> 0.2.5'
    dependency 'BaseKit/FormField', '~> 0.2.5'
    dependency 'BaseKit/FormMapping', '~> 0.2.5'

# Tutorials

[Create iPhone and iPad IOS FORM with BaseKit](http://blog.brunowernimont.be/2012/05/12/create_ios_form_easily_with_basekit.html)

[UITableView Dynamic cell mapping like Restkit](http://blog.brunowernimont.be/2012/01/08_uitableview_dynamic_cell_mapping_like_restkit.html)

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
     	return [[AnyViewController alloc] init];
	} animated:YES];

Push view controller with block.

	[self.navigationController pushViewControllerWithBlock:^UIViewController *{
        return [[AnyViewController alloc] init];
    } animated:YES];

# Cell mapping

Create table view with blocks based syntax.

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

# Form mapping

FormMapping is a library for building form with table view. Fields data are automatically filled from a model. When data changed it's automatically savec inside the object.

BaseKit use an external library called ActionSheetPicker but unfortunately that library doesn't support ARC yet, so you need to add "-fno-objc-arc" when you import it to your project.

	self.formModel = [BKFormModel formTableModelForTableView:self.tableView navigationController:self.navigationController];
    
    [BKFormMapping mappingForClass:[Movie class] block:^(BKFormMapping *formMapping) {
        [formMapping sectiontTitle:@"Information section" identifier:@"info"];
        [formMapping mapAttribute:@"title" title:@"Title" type:BKFormAttributeMappingTypeText];
        [formMapping mapAttribute:@"releaseDate" title:@"ReleaseDate" type:BKFormAttributeMappingTypeDatePicker];
        [formMapping mapAttribute:@"suitAllAges" title:@"All ages" type:BKFormAttributeMappingTypeBoolean];
        [formMapping mapAttribute:@"shortName" title:@"ShortName" type:BKFormAttributeMappingTypeLabel];
        [formMapping mapAttribute:@"numberOfActor" title:@"Number of actor" type:BKFormAttributeMappingTypeInteger];
        [formMapping mapAttribute:@"content" title:@"Content" type:BKFormAttributeMappingTypeBigText];
        
        [formMapping mapAttribute:@"choice" title:@"Choices" selectValuesBlock:^NSArray *(id value, id object, NSInteger *selectedValueIndex){
            *selectedValueIndex = 1;
            return [NSArray arrayWithObjects:@"choice1", @"choice2", nil];
        } valueWithBlock:^id(id value, id object, NSInteger selectedValueIndex) {
            return value;
        }];
        
        [formMapping buttonSave:@"Save" handler:^{
        }];
        
        [self.formModel registerMapping:formMapping];
    }];
    
    [self.formModel loadFieldsWithObject:movie];

![Form Mapping](https://github.com/brunow/BaseKit/raw/master/form-mapping.png)

For more **example** open **Examples/FormMappingExample/FormMappingExample.xcodeproj project**.

# LocationManager

Easy to use CoreLocation manager with block or default delegate.

    BKLocationManager *manager = [BKLocationManager sharedManager];
    
    [manager setDidUpdateLocationBlock:^(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation) {
        NSLog(@"didUpdateLocation");
    }];
    
    [manager setDidFailBlock:^(CLLocationManager *manager, NSError *error) {
        NSLog(@"didFailUpdateLocation");
    }];
    
    [manager startUpdatingLocationWithAccuracy:kCLLocationAccuracyHundredMeters];


# ARC Support

BaseKit is fully compatible out of box with both ARC and non-ARC project.

# Changelog

- 2012/06/02 (0.2.4)
    - Fix FormMapping value saving bug

- 2012/05/17 (0.2.3)
	- Fix cell mapping editing style bug

- 2012/05/12 (0.2)
	- Added LocationManager
	- Added FormField
	- Added FormMapping

- 2012/01/29 (0.1)
	- Initial release.

# App using BaseKit

If you use BaseKit I'll be happy to add your app name here.

[LiègeExpo2017](http://itunes.apple.com/fr/app/liege-expo-2017/id505451794?mt=8)

# Contact

Bruno Wernimont

- http://twitter.com/brunowernimont