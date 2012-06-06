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

#import "UIViewController+BaseKitViewDecorator.h"

#import "UIView+BaseKitViewDecorator.h"
#import "BKViewDecorator.h"
#import "BKViewDecoratorBlocks.h"

#import <objc/runtime.h>

static char viewDecoratorsKey;

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface UIViewController (Private)

- (BOOL)isViewOfTypeButton:(UIView *)view;

@end


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIViewController (BaseKitViewDecorator)

@dynamic viewDecorators;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadDecoratorWithStrings:(NSString *)klass, ... {
    va_list args;
    va_start(args, klass);
    NSMutableArray *decorators = [[NSMutableArray alloc] init];
    for (NSString *value = klass; value != nil; value = va_arg(args, NSString *)) {
        Class klass = NSClassFromString(value);
        id decorator = [[klass alloc] init];
        [decorators addObject:decorator];
    }
    va_end(args);
    
    self.viewDecorators = decorators;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)unloadDecorator {
    self.viewDecorators = nil;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)decorateView:(UIView *)viewToDecorate {
    NSLog(@"%@", NSStringFromClass([viewToDecorate class]));
    [self.viewDecorators enumerateObjectsUsingBlock:^(BKViewDecorator *decorator, NSUInteger idx, BOOL *stop) {
        
        if ([self isViewOfTypeButton:viewToDecorate]) {
            BKButtonDecoratorBlock block = [decorator.buttonDecorators objectForKey:viewToDecorate.identifier];
            
            if (nil != block) {
                block((UIButton *)viewToDecorate);
            }
            
        } else if ([viewToDecorate isMemberOfClass:[UILabel class]]) {
            BKLabelDecoratorBlock block = [decorator.labelDecorators objectForKey:viewToDecorate.identifier];
            
            if (nil != block) {
                block((UILabel *)viewToDecorate);
            }
            
        } else if ([viewToDecorate isMemberOfClass:[UIView class]]) {
            BKViewDecoratorBlock block = [decorator.viewDecorators objectForKey:viewToDecorate.identifier];
            
            if (nil != block) {
                block(viewToDecorate);
            }
            
        }
        
    }];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)decorateView:(UIView *)viewToDecorate withIdentifier:(NSString *)identifier {
    viewToDecorate.identifier = identifier;
    [self decorateView:viewToDecorate];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Getters and setters


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setViewDecorators:(NSArray *)viewDecorators {
    [self willChangeValueForKey:@"viewDecorators"];
    objc_setAssociatedObject(self, &viewDecoratorsKey,
                             viewDecorators,
                             OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"viewDecorators"];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *)viewDecorators {
    return objc_getAssociatedObject(self, &viewDecoratorsKey);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isViewOfTypeButton:(UIView *)aView {
    BOOL isButton = NO;
    
    if ([aView isMemberOfClass:[UIButton class]]) {
        isButton = YES;
    } else {
        NSString *stringClass = NSStringFromClass([aView class]);
        
        if ([stringClass isEqualToString:@"UIRoundedRectButton"]) {
            isButton = YES;
        }
    }
    
    return isButton;
}


@end
