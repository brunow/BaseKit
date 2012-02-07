//
//  Movie.h
//  CellMappingExample
//
//  Created by Bruno Wernimont on 5/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, readonly) NSString *imageName;

+ (id)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle;

+ (id)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle type:(NSString *)type;

@end
