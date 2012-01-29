//
//  BKNetworkClientTest.m
//  BaseKit
//
//  Created by Bruno Wernimont on 27/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
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
