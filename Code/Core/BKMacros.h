//
// Created by Bruno Wernimont on 2012
// Copyright 2012 BaseKit
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
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



