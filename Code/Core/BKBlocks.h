//
//  BWBlocks.h
//  BWKit
//
//  Created by Bruno Wernimont on 5/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#if NS_BLOCKS_AVAILABLE

typedef void (^BKBasicBlock)(void);

typedef void (^BKIterationBlock)(int number);

typedef void (^BKObserverBlock)(NSDictionary *change);

typedef void (^BKErrorBLock)(NSError *error);

#endif