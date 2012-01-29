//
//  NSString+BWKit.m
//  BWKit
//
//  Created by Bruno Wernimont on 6/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+BaseKit.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSString (BaseKit)


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)stringByCapitalizingFirstLetter {
    NSRange firstLetterRange = NSMakeRange(0, 1);
    NSString *firstLetter = [[self substringWithRange:firstLetterRange] uppercaseString];
    
    return [self stringByReplacingCharactersInRange:firstLetterRange withString:firstLetter];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)stringByCamelizingString {
    NSArray *words = [self componentsSeparatedByString:@"_"];
    NSMutableString *camelizedString = [NSMutableString string];
    
    for (NSString *word in words) {
        NSString *capitalizedWord = [word stringByCapitalizingFirstLetter];
        
        [camelizedString appendString:capitalizedWord];
    }
    
    NSString *firstLetter = [[self substringToIndex:1] lowercaseString];    
    [camelizedString replaceCharactersInRange:NSMakeRange(0, 1) withString:firstLetter];
    
    return camelizedString;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)containsString:(NSString *)string {
    return ([self rangeOfString:string].location == NSNotFound) ? NO : YES;
}

@end
