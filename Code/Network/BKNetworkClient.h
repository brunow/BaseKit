//
//  BKClient.h
//  BaseKit
//
//  Created by Bruno Wernimont on 26/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AFHTTPClient.h"

@interface BKNetworkClient : AFHTTPClient

+ (id)sharedClient;

+ (void)setSharedClient:(id)client;

+ (id)clientWithBaseURL:(NSString *)URL;

- (id)initWithBaseURL:(NSURL *)url;

@end
