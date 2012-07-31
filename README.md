BaseKit is a set of IOS class to make your life easier.

# Attention

CellMapping and FormMapping will be removed from BaseKit, because it's too big to maintain.
CellMapping is now called [TableKit.m](https://github.com/brunow/TableKit.m) and FormMapping is called [FormKit.m](https://github.com/brunow/FormKit.m).

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

Cell mapping has moved to [TableKit.m](https://github.com/brunow/TableKit.m).

# Form mapping

Form mapping has moved to [FormKit.m](https://github.com/brunow/FormKit.m).

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