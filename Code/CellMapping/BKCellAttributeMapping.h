//
//  BKCellAttributeMapping.h
//  BaseKit
//
//  Created by Bruno Wernimont on 1/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BKCellMappingBlocks.h"

typedef enum {
    BKCellAttributeMappingTypeDefault = 0,
} BKCellAttributeMappingType;

@interface BKCellAttributeMapping : NSObject

@property (nonatomic, assign) BKCellAttributeMappingType mappingType;
@property (nonatomic, copy) NSString *keyPath;
@property (nonatomic, copy) NSString *attribute;
@property (nonatomic, copy) BKCellValueBlock valueBlock;

/*
 * Convenient method to get an attributeMapping
 */
+ (id)attributeMapping;

@end
