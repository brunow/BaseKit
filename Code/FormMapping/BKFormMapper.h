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

#import <Foundation/Foundation.h>

@class BKFormMapping;
@class BKFormAttributeMapping;
@class BKFormModel;

@interface BKFormMapper : NSObject <UITextFieldDelegate, UITextViewDelegate> {
    BKFormMapping *_formMapping;
    UITableView *_tableView;
    id _object;
    BKFormModel *_formModel;
}

@property (nonatomic, readonly) BKFormMapping *formMapping;
@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, readonly) id object;
@property (nonatomic, readonly) BKFormModel *formModel;

- (id)initWithFormMapping:(BKFormMapping *)formMapping
                tabelView:(UITableView *)tableView
                   object:(id)object
                formModel:(BKFormModel *)formModel;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (NSString *)titleForHeaderInSection:(NSInteger)section;

- (NSString *)titleForFooterInSection:(NSInteger)sectionIndex;

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (BKFormAttributeMapping *)attributeMappingAtIndexPath:(NSIndexPath *)indexPath;

- (id)valueForAttriteMapping:(BKFormAttributeMapping *)attributeMapping;

- (void)setValue:(id)value forAttributeMapping:(BKFormAttributeMapping *)attributeMapping;

- (NSIndexPath *)indexPathOfAttributeMapping:(BKFormAttributeMapping *)attributeMapping;

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
