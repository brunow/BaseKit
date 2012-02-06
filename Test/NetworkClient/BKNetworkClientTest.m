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

@interface BKNetworkClientTest : GHTestCase
@end

@implementation BKNetworkClientTest

////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)shouldRunOnMainThread {
    return YES;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setUp {
    [BKNetworkClient setSharedClient:nil];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldSetDefaultClientIfNoSet {
    [BKNetworkClient clientWithBaseURL:@"http://localhost:3000"];
    
    GHAssertNotNil([BKNetworkClient sharedClient], nil);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)testShouldReturnBaseURL {
    NSString *url = @"http://localhost:3000";
    BKNetworkClient *client = [BKNetworkClient clientWithBaseURL:url];
    
    GHAssertTrue([client.baseURL.absoluteString isEqualToString:url], nil);
}

- (void)testShould {
    [BKNetworkClient clientWithBaseURL:@"http://localhost:3000/api/v1"];
    
    [[BKNetworkClient sharedClient] getPath:@"/synchronize2" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
