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

@interface NSMutableArrayBaseKitTest : GHTestCase
@end

@implementation NSMutableArrayBaseKitTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldAddObjectToArray {
    NSString *object = @"object";
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:object defaultValue:@"default string"];
    
    GHAssertTrue([array objectAtIndex:0] == object, nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldAddDefaultObjectToArray {
    NSString *defaultObject = @"default object";
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:nil defaultValue:defaultObject];
    
    GHAssertTrue([array objectAtIndex:0] == defaultObject, nil);
}

@end
