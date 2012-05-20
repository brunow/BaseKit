#import "Kiwi.h"
#import "Item.h"
#import "BKCellMapper.h"

SPEC_BEGIN(BKCellMapperSpecs)

describe(@"cell mapping specs", ^{
    NSMutableArray *_dynamicCellMappings = [NSMutableArray array];
    BKCellMapping __block *_cellMapping;
    BKTableModel *_tableModel = [BKTableModel tableModelForTableView:[[UITableView alloc] init]];
    Item *_item = [Item itemWithTitle:@"title" subtitle:@"subtitle" type:@"dvd"];
    
    beforeAll(^{
        [BKCellMapping mappingForObjectClass:[NSString class] block:^(BKCellMapping *cellMapping) {
            [_tableModel registerMapping:cellMapping];
        }];
        
        [BKDynamicCellMapping mappingForObjectClass:[Item class] block:^(BKDynamicCellMapping *cellMapping) {
            [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
            
            [cellMapping onSelectRowWithBlock:^(UITableViewCell *cell, Item *item, NSIndexPath *indexPath) {
                
            }];
            
            [cellMapping mapObjectToCellClass:[UITableViewCell class] whenValueOfKeyPath:@"type" isEqualTo:@"book"];
            [_tableModel registerMapping:cellMapping];
            [_dynamicCellMappings addObject:cellMapping];
        }];
        
        [BKCellMapping mappingForObjectClass:[NSDictionary class] block:^(BKCellMapping *cellMapping) {
            [_tableModel registerMapping:cellMapping];
        }];
        
        [BKDynamicCellMapping mappingForObjectClass:[Item class] block:^(BKDynamicCellMapping *cellMapping) {
            [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
            [cellMapping mapKeyPath:@"subtitle" toAttribute:@"detailTextLabel.text"];
            
            [cellMapping onSelectRowWithBlock:^(UITableViewCell *cell, Item *item, NSIndexPath *indexPath) {
                
            }];
            
            [cellMapping mapObjectToCellClass:[UITableViewCell class] whenValueOfKeyPath:@"type" isEqualTo:@"dvd"];
            [_tableModel registerMapping:cellMapping];
            [_dynamicCellMappings addObject:cellMapping];
            _cellMapping = cellMapping;
        }];
        
        [BKCellMapping mappingForObjectClass:[NSSet class] block:^(BKCellMapping *cellMapping) {
            [_tableModel registerMapping:cellMapping];
        }];
    });
    
    it(@"should return right dynamic mappings set", ^{
        NSSet *mappings = [BKCellMapper cellMappingsForObject:_item mappings:_tableModel.objectMappings];
        [[mappings should] have:2];
        [[mappings should] containObjects:[_dynamicCellMappings objectAtIndex:0],
                                          [_dynamicCellMappings objectAtIndex:1], nil];
    });
    
    it(@"should return right mapping", ^{
        NSSet *mappings = [BKCellMapper cellMappingsForObject:_item mappings:_tableModel.objectMappings];
        BKCellMapping *cellMapping = [BKCellMapper cellMappingForObject:_item mappings:mappings];
        id expected = _cellMapping;
        [[theValue(cellMapping) should] equal:theValue(expected)];
    });
    
    it(@"should map right attributes values", ^{
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        [BKCellMapper mapCellAttributeWithMapping:_cellMapping object:_item cell:cell];
        [[cell.textLabel.text should] equal:_item.title];
        [[cell.detailTextLabel.text should] equal:_item.subtitle];
    });

});

SPEC_END