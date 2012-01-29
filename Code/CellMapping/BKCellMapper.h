//
//  BKCellMapper.h
//  BaseKit
//
//  Created by Bruno Wernimont on 2/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BKCellMapping;

@interface BKCellMapper : NSObject

@property (nonatomic, readonly) BKCellMapping *cellMapping;
@property (nonatomic, readonly) id object;
@property (nonatomic, readonly) UITableViewCell *cell;

+ (NSSet *)cellMappingsForObject:(id)object mappings:(NSDictionary *)mappings;

+ (BKCellMapping *)cellMappingForObject:(id)object mappings:(NSSet *)mappings;

+ (void)mapCellAttributeWithMapping:(BKCellMapping *)cellMapping
                             object:(id)object
                               cell:(UITableViewCell *)cell;

@end
