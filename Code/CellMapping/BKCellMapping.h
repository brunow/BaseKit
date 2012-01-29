//
//  BKCellObjectMapping.h
//  BaseKit
//
//  Created by Bruno Wernimont on 1/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BKCellMappingBlocks.h"

@interface BKCellMapping : NSObject

@property (nonatomic, assign) Class objectClass;
@property (nonatomic, assign) Class cellClass;
@property (nonatomic, readonly) NSMutableDictionary *attributeMappings;
@property (nonatomic, retain) UINib *nib;

- (id)initWithObjectClass:(Class)objectClass;

+ (id)mappingForObjectClass:(Class)objectClass block:(void(^)(BKCellMapping *cellMapping))block;

- (void)mapKeyPath:(NSString *)keyPath
       toAttribute:(NSString *)attribute
        valueBlock:(BKCellValueBlock)valueBlock;

- (void)mapKeyPath:(NSString *)keyPath toAttribute:(NSString *)attribute;

- (void)mapKeyPath:(NSString *)keyPath
           toLabel:(NSString *)attribute
        valueBlock:(BKCellValueBlock)valueBlock;

- (void)mapObjectToCellClass:(Class)cellClass;

@end
