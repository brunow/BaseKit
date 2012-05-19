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

#import "BKMacrosDefinitions.h"

@class BKCellMapping;

@interface BKCellMapper : NSObject

@property (nonatomic, readonly, strong) BKCellMapping *cellMapping;
@property (nonatomic, readonly, strong) id object;
@property (nonatomic, readonly, strong) UITableViewCell *cell;

+ (NSSet *)cellMappingsForObject:(id)object mappings:(NSDictionary *)mappings;

+ (BKCellMapping *)cellMappingForObject:(id)object mappings:(NSSet *)mappings;

+ (void)mapCellAttributeWithMapping:(BKCellMapping *)cellMapping
                             object:(id)object
                               cell:(UITableViewCell *)cell;

@end
