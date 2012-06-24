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

#import "UIView+BaseKitViewDecorator.h"

#import <objc/runtime.h>

static char identifierKey;


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIView (BaseKitViewDecorator)

@dynamic identifier;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setIdentifier:(NSString *)identifier {
    [self willChangeValueForKey:@"identifier"];
    objc_setAssociatedObject(self, &identifierKey,
                             identifier,
                             OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"identifier"];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)identifier {
    return objc_getAssociatedObject(self, &identifierKey);
}


@end
