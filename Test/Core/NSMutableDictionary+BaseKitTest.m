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

@interface NSMutableDictionaryBaseKitTest : GHTestCase
@end

@implementation NSMutableDictionaryBaseKitTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldAddObjectToDictionary {
    NSString *object = @"object";
    NSString *key = @"key";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:object forKey:key defaultValue:nil];
    
    GHAssertTrue([dict objectForKey:key] == object, nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldAddDefaultObjectToDictionnary {
    NSString *defaultObject = @"default object";
    NSString *key = @"key";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:nil forKey:key defaultValue:defaultObject];

    GHAssertTrue([dict objectForKey:key] == defaultObject, nil);
}

@end
