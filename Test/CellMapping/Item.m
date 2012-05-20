#import "Item.h"

@implementation Item

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize type = _type;


+ (id)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle {
    Item *item = [[self alloc] init];
    
    item.title = title;
    item.subtitle = subtitle;
    
    return item;
}

+ (id)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle type:(NSString *)type {
    Item *item = [[self alloc] init];
    
    item.title = title;
    item.subtitle = subtitle;
    item.type = type;
    
    return item;
}

- (NSString *)imageName {
    return @"tux.png";
}

@end
