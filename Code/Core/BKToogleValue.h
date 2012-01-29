//
//  BKToogleValue.h
//  BaseKit
//
//  Created by Bruno Wernimont on 10/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKToogleValue : NSObject

@property (nonatomic, retain) id firstValue;
@property (nonatomic, retain) id secondValue;
@property (nonatomic, assign) BOOL isFirstValueSelected;
@property (nonatomic, readonly) id currentValue;

+ (id)firstValue:(id)firstValue secondValue:(id)secondValue;

- (id)initWithFirstValue:(id)firstValue secondValue:(id)secondValue;

- (void)toggle;

@end
