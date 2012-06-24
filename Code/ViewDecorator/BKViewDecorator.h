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

#import "BKViewDecoratorBlocks.h"

@class BKViewDecorator;

#define BKViewDecorateController(klass) \
- (id)init { \
    self = [super init];\
    if (self) {\
        self.objectClass = [klass class];\
    }\
    return self;\
}\

@interface BKViewDecorator : NSObject

@property (nonatomic, assign) Class objectClass;
@property (nonatomic, strong) NSMutableDictionary *buttonDecorators;
@property (nonatomic, strong) NSMutableDictionary *labelDecorators;
@property (nonatomic, strong) NSMutableDictionary *viewDecorators;

- (void)decorateButtonWithIdentifier:(NSString *)identifier block:(BKButtonDecoratorBlock)block;

- (void)decorateLabelWithIdentifier:(NSString *)identifier block:(BKLabelDecoratorBlock)block;

- (void)decorateViewWithIdentifier:(NSString *)identifier block:(BKViewDecoratorBlock)block;

- (void)decorateButtons;

- (void)decorateLabels;

- (void)decorateViews;

@end


