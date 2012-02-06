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

@interface BKIterationHelperTest : GHTestCase
@end

@implementation BKIterationHelperTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldIterateTilFour {
    __block int i = 0;
    int mustEgalTo = 4;
    
    [BKIteratingHelper iterateTil:mustEgalTo usingBlock:^(int number) {
        i++;
    }];

    GHAssertTrue(i == mustEgalTo, @"Ok");
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldIterateTilFourByTwo {
    __block int i = 0;
    
    [BKIteratingHelper iterateTil:6 bySlice:2 usingBlock:^(int number) {
        i++;
    }];
    
    GHAssertTrue(i == 3, @"Ok");
}

@end
