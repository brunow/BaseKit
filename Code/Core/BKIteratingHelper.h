//
//  BWIterating.h
//  BWKit
//
//  Created by Bruno Wernimont on 5/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BKBlocks.h"

@interface BKIteratingHelper : NSObject

#if NS_BLOCKS_AVAILABLE

/**
 * Iterate from zero til a given number by a given slice and execute each time a block.
 *
 * [BWIterating iterateTil:10 bySlice:2 usingBlock:^(int number) {
 *      NSLog(@"Number %d", number);
 * }];
 */
+ (void)iterateTil:(int)iterateTil bySlice:(int)slice usingBlock:(BKIterationBlock)iterationBlock;

/**
 * Iterate from zero til a given number and execute each time a block.
 *
 * [BWIterating iterateTil:10 usingBlock:^(int number) {
 *      NSLog(@"Number %d", number);
 * }];
 */
+ (void)iterateTil:(int)iterateTil usingBlock:(BKIterationBlock)iterationBlock;

#endif

@end
