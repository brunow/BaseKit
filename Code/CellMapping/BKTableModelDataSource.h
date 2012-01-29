//
//  BKTableModelDataSource.h
//  BaseKit
//
//  Created by Bruno Wernimont on 2/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BKTableModel;

@protocol BKTableModelDataSource <NSObject>

- (id)tableModel:(BKTableModel *)tableModel objectForRowAtIndexPAth:(NSIndexPath *)indexPath;

@end
