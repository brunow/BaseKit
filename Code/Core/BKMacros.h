//
//  BKMemory.h
//  BaseKit
//
//  Created by Bruno Wernimont on 24/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef BK_HAS_ARC
#define BK_HAS_ARC __has_feature(objc_arc)
#endif

#if BK_HAS_ARC
    #define BK_RETAIN(xx)           xx
    #define BK_RELEASE(xx)
    #define BK_AUTORELEASE(xx)      xx
    #define BK_PROP_COPY nonatomic, copy
    #define BK_PROP_RETAIN strong
    #define BK_RELEASE_SAFELY(xx)
    #define BK_UNRETAINED_BLOCK_IVAR __unsafe_unretained
#else
    #define BK_RETAIN(xx)             [xx retain];
    #define BK_RELEASE(xx)            [xx release];
    #define BK_AUTORELEASE(xx)        [xx autorelease];
    #define BK_PROP_COPY nonatomic,   copy
    #define BK_PROP_RETAIN retain
    #define BK_RELEASE_SAFELY(xx)     { [xx release]; xx = nil; }
    #define BK_UNRETAINED_BLOCK_IVAR __block
#endif


#define __NI_DEPRECATED_METHOD __attribute__((deprecated))