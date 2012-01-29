//
//  BKDynamicCellMapping.m
//  LgExpo
//
//  Created by Bruno Wernimont on 4/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BKDynamicCellMapping.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BKDynamicCellMapping

@synthesize dynamicKeyPath = _dynamicKeyPath;
@synthesize keyPathEqualTo = _keyPathEqualTo;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    self.dynamicKeyPath = nil;
    self.keyPathEqualTo = nil;
    
    [super dealloc];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)mappingForObjectClass:(Class)objectClass block:(void(^)(BKDynamicCellMapping *cellMapping))block {
    BKDynamicCellMapping *cellMapping = [[self alloc] initWithObjectClass:objectClass];
    
    block(cellMapping);
    
    return [cellMapping autorelease];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)mapObjectToCellClass:(Class)cellClass
          whenValueOfKeyPath:(NSString *)valueOfKeyPath
                   isEqualTo:(id)equalTo {
    
    [self mapObjectToCellClass:cellClass];
    self.dynamicKeyPath = valueOfKeyPath;
    self.keyPathEqualTo = equalTo;
}

@end
