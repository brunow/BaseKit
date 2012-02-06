BKCellMapping is an IOS library that make your life easier with UITableView.

## Installation

Simply add CellMapping dir into your project.


## ARC Support

I'm not planning on supporting ARC at the moment.

## Usage


### Set items

    self.items = [NSArray arrayWithObjects:
                  [Item itemWithTitle:@"Movie1" subtitle:@"First movie" type:@"movie"],
                  [Item itemWithTitle:@"Movie2" subtitle:@"Second movie" type:@"movie"],
                  [Item itemWithTitle:@"Book1" subtitle:nil type:@"book"],
                  nil];

### Configure the mapping

    self.tableModel = [BKTableModel tableModelForTableView:self.tableView delegate:self];

    [BKCellMapping mappingForObjectClass:[Item class] block:^(BKCellMapping *cellMapping) {
	    [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
	    [cellMapping mapKeyPath:@"subtitle" toAttribute:@"detailTextLabel.text"];
	    [cellMapping mapObjectToCellClass:[BookViewCell class]];
	    
	    cellMapping.onSelectRow = ^(UITableViewCell *cell, id object, NSIndexPath *indexPath) {
	    	NSLog(@"did select row");
	    };
	    
	    [self.tableModel registerMapping:cellMapping];
    }];

### UITableViewDelegate

	- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    	[self.tableModel didSelectRowAtIndexPath:indexPath];
	}

### UITableViewDataSource

    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 1;
    }

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.items.count;
	}

	- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)	indexPath {
    		return [self.tableModel cellForRowAtIndexPath:indexPath];
	}

### BKTableModelDataSource

	#pragma mark - BKTableModelDataSource

	- (id)tableModel:(BKTableModel *)tableModel objectForRowAtIndexPAth:(NSIndexPath *)indexPath {
    	return [self.items objectAtIndex:indexPath.row];
	}

That's it.
