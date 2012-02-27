BaseKit is a set of IOS class to make your life easier.

# Installation

Simply add Code and Vendor dir into your project.

# Core
------

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

### NSArray
-----------

	@property (nonatomic, readonly) BOOL isEmpty;
	
	- (id)firstObject;

	- (BOOL)boolValueAtIndex:(NSInteger)index;

	- (int)intValueAtIndex:(NSInteger)index;

	- (NSInteger)integerValueAtIndex:(NSInteger)index;

	- (float)floatValueAtIndex:(NSInteger)index;

	- (double)doubleValueAtIndex:(NSInteger)index;

	- (NSString *)stringValueAtIndex:(NSInteger)index;

	- (NSNumber *)numberValueAtIndex:(NSInteger)index;

### NSDictionary
----------------

	@property (nonatomic, readonly) BOOL isEmpty;

	- (BOOL)containsObjectForKey:(id)key;

	- (id)objectForKey:(id)aKey defaultObject:(id)defaultObject;

	- (BOOL)boolValueForKey:(id)aKey defaultValue:(BOOL)defaultValue;

	- (BOOL)boolValueForKey:(id)aKey;

	- (int)intValueForKey:(id)aKey;

	- (float)floatValueForKey:(id)aKey defaultValue:(float)defaultValue;

	- (float)floatValueForKey:(id)aKey;

	- (NSInteger)integerValueForKey:(id)aKey defaultValue:(NSInteger)defaultValue;

	- (NSInteger)integerValueForKey:(id)aKey;

	- (double)doubleValueForKey:(id)aKey defaultValue:(NSInteger)defaultValue;

	- (double)doubleValueForKey:(id)aKey;

	- (NSString *)stringValueForKey:(id)aKey defaultValue:(NSString *)defaultValue;

	- (NSString *)stringValueForKey:(id)aKey;

	- (NSNumber *)numberValueForKey:(id)aKey defaultValue:(NSNumber *)defaultValue;

	- (NSNumber *)numberValueForKey:(id)aKey;


### NSMutableArray
------------------

	- (void)addObject:(id)anObject defaultValue:(id)defaultValue;

### NSMutableDictionary
-----------------------

	- (void)setObject:(id)anObject forKey:(id)aKey defaultValue:(id)defaultValue;

### NSOperationQueue
--------------------

	@property (nonatomic, readonly) BOOL isEmpty;

### NSSet
---------

	@property (nonatomic, readonly) BOOL isEmpty;

### NSString
------------

	- (NSString *)stringByCapitalizingFirstLetter;

	- (NSString *)stringByCamelizingString;

	- (BOOL)containsString:(NSString *)string;

# View
------

Present modal view controller with block.

	[self presentModalViewControllerWithBlock:^UIViewController *{
     	return [[[AnyViewController alloc] init] autorelease];
	} animated:YES];

Push view controller with block.

	[self.navigationController pushViewControllerWithBlock:^UIViewController *{
        return [[[AnyViewController alloc] init] autorelease];
    } animated:YES];

# Cell mapping
--------------

	- (void)viewDidLoad {
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
	    ];

		NSArray *items = [NSArray arrayWithObjects:
                      		[Item itemWithTitle:@"Simple mapping"],
                      		[Item itemWithTitle:@"Nib cell example"],
                      		nil];
    
	    [self.tableModel loadTableItems:items];
	}

For more **example** open **Examples/CellMappingExample/CellMappingExample.xcodeproj project**.


# ARC Support
-------------

I'm not planning on supporting ARC at the moment.

