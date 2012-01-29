//
//  NSManagedObject+BWKit.h
//  BWKit
//
//  Created by Bruno Wernimont on 5/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (BaseKit)


/**
 * Simple return the primary key attribute.
 *
 * For example you have a class named Movie it return as primary key: movieID.
 */
+ (NSString *)primaryKeyAttribute;

/**
 * See above
 */
- (NSString *)primaryKeyAttribute;

@end
