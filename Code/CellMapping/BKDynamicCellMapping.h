//
//  BKDynamicCellMapping.h
//  LgExpo
//
//  Created by Bruno Wernimont on 4/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BKCellMapping.h"

@interface BKDynamicCellMapping : BKCellMapping

@property (nonatomic, copy) NSString *dynamicKeyPath;
@property (nonatomic, retain) NSString *keyPathEqualTo;

+ (id)mappingForObjectClass:(Class)objectClass block:(void(^)(BKDynamicCellMapping *cellMapping))block;

- (void)mapObjectToCellClass:(Class)cellClass
          whenValueOfKeyPath:(NSString *)valueOfKeyPath
                   isEqualTo:(id)equalTo;

@end
