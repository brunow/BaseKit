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

#import "BKFormModel.h"

#import "BKFormMapping.h"
#import "BKFormMapper.h"
#import "ActionSheetStringPicker.h"
#import "ActionSheetDatePicker.h"
#import "BKSaveButtonField.h"
#import "BaseKitFormField.h"
#import "UIView+BaseKit.h"
#import "NSObject+BKFormAttributeMapping.h"
#import "BKMacrosDefinitions.h"
#import "BKOperationHelper.h"
#import "UINavigationController+BaseKit.h"
#import "BWSelectViewController.h"

#import "BWLongTextViewController.h"


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BKFormModel ()

@property (nonatomic, retain) BKFormMapping *formMapping;
@property (nonatomic, retain) BKFormMapper *formMapper;

- (void)showTextViewControllerWithAttributeMapping:(BKFormAttributeMapping *)attributeMapping;

- (void)showSelectPickerWithAttributeMapping:(BKFormAttributeMapping *)attributeMapping;

- (void)showDatePickerWithAttributeMapping:(BKFormAttributeMapping *)attributeMapping;

- (void)showSelectWithAttributeMapping:(BKFormAttributeMapping *)attributeMapping;

@end


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BKFormModel

@synthesize tableView = _tableView;
@synthesize formMapping = _formMapping;
@synthesize object = _object;
@synthesize formMapper = _formMapper;
@synthesize navigationController = _navigationController;
@synthesize selectControllerClass = _selectControllerClass;


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)formTableModelForTableView:(UITableView *)tableView {
    return [self formTableModelForTableView:tableView navigationController:nil];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)formTableModelForTableView:(UITableView *)tableView
            navigationController:(UINavigationController *)navigationController {
    
    return [[self alloc] initWithTableView:tableView
                      navigationController:navigationController];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithTableView:(UITableView *)tableView
   navigationController:(UINavigationController *)navigationController {
    
    self = [self init];
    if (self) {
        self.tableView = tableView;
        self.navigationController = navigationController;
    }
    return self;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
    self = [super init];
    if (self) {
        self.selectControllerClass = [BWSelectViewController class];
    }
    return self;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSections {
    return [self.formMapper numberOfSections];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return [self.formMapper numberOfRowsInSection:section];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)titleForHeaderInSection:(NSInteger)section {
    return [self.formMapper titleForHeaderInSection:section];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)titleForFooterInSection:(NSInteger)section {
    return [self.formMapper titleForFooterInSection:section];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.formMapper cellForRowAtIndexPath:indexPath];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[self.tableView findFirstResponder] resignFirstResponder];
    
    BKFormAttributeMapping *attributeMapping = [self.formMapper attributeMappingAtIndexPath:indexPath];
    
    if (nil != attributeMapping.selectValuesBlock) {
        if (attributeMapping.showInPicker)
            [self showSelectPickerWithAttributeMapping:attributeMapping];
        else
            [self showSelectWithAttributeMapping:attributeMapping];
        
    } else if (nil != attributeMapping.saveBtnHandler) {
        attributeMapping.saveBtnHandler();
        
    } else if (nil != attributeMapping.btnHandler) {
        attributeMapping.btnHandler(self.object);
        
    } else if (BKFormAttributeMappingTypeBigText == attributeMapping.type) {
        [self showTextViewControllerWithAttributeMapping:attributeMapping];

    } else if (BKFormAttributeMappingTypeText == attributeMapping.type) {
        BKTextField *textFieldCell = (BKTextField *)[self cellForRowAtIndexPath:indexPath];
        [textFieldCell.textField becomeFirstResponder];
        
    } else if (BKFormAttributeMappingTypeDateTime == attributeMapping.type ||
               BKFormAttributeMappingTypeTime == attributeMapping.type ||
               BKFormAttributeMappingTypeDate == attributeMapping.type) {
        
        [self showDatePickerWithAttributeMapping:attributeMapping];
        
    } else if (BKFormAttributeMappingTypeCustomCell == attributeMapping.type) {
        if (nil != attributeMapping.cellSelectionBlock) {
            UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
            attributeMapping.cellSelectionBlock(cell, indexPath, self.object);
        }
        
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)registerMapping:(BKFormMapping *)formMapping {
    self.formMapping = formMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadFieldsWithObject:(id)object {
    self.object = object;
    
    self.formMapper = [[BKFormMapper alloc] initWithFormMapping:self.formMapping
                                                      tabelView:self.tableView
                                                         object:self.object
                                                      formModel:self];
    
    [self.tableView reloadData];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)reloadRowWithAttributeMapping:(BKFormAttributeMapping *)attributeMapping {
    __block NSIndexPath *indexPath = nil;
    [BKOperationHelper performBlockInBackground:^{
        indexPath = [self.formMapper indexPathOfAttributeMapping:attributeMapping];
    } completion:^{
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationNone];
    }];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)findFirstTextField {
    return [self.tableView findFirstTextField];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *)findTextFields {
    return [self.tableView findTextFields];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)save {
    // Because value of UITextField is saved after resign
    [[self.tableView findFirstResponder] resignFirstResponder];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Getters and setters


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTableView:(UITableView *)tableView {
    if (_tableView != tableView) {
        _tableView = tableView;
    }
    
    tableView.dataSource = self;
    tableView.delegate = self;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setObject:(id)object {
    if (object != _object) {
        _object = object;
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDataSource


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self numberOfSections];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self numberOfRowsInSection:section];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self cellForRowAtIndexPath:indexPath];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self titleForHeaderInSection:section];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [self titleForFooterInSection:section];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.formMapper heightForRowAtIndexPath:indexPath];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDelegate


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self didSelectRowAtIndexPath:indexPath];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIScrollViewDelegate


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_canHideKeyBoard) {
        [[self.tableView findFirstResponder] resignFirstResponder];
        _canHideKeyBoard = NO;
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    _canHideKeyBoard = YES;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)showTextViewControllerWithAttributeMapping:(BKFormAttributeMapping *)attributeMapping {
    BK_WEAK_IVAR BKFormModel *weakRef = self;
    [self.navigationController pushViewControllerWithBlock:^UIViewController *{
        Class controllerClass = (attributeMapping.controllerClass == nil) ?
                                [BWLongTextViewController class] : attributeMapping.controllerClass;
        
        NSString *value = [self.formMapper valueForAttriteMapping:attributeMapping];
        BWLongTextViewController *vc = [[controllerClass alloc] initWithText:value];
        vc.title = attributeMapping.title;
        vc.textView.delegate = weakRef.formMapper;
        vc.textView.formAttributeMapping = attributeMapping;
        return vc;
    } animated:YES];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)showSelectPickerWithAttributeMapping:(BKFormAttributeMapping *)attributeMapping {
    BK_WEAK_IVAR BKFormModel *weakRef = self;
    ActionStringDoneBlock done = ^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        BKFormAttributeMapping *formAttributeMapping = picker.formAttributeMapping;
        id value = formAttributeMapping.valueFromSelectBlock(selectedValue, self.object, selectedIndex);
        [weakRef.formMapper setValue:value forAttributeMapping:formAttributeMapping];
        [weakRef reloadRowWithAttributeMapping:formAttributeMapping];
    };
    
    NSInteger selectedIndex = 0;
    ActionSheetStringPicker *picker;
    picker = [ActionSheetStringPicker showPickerWithTitle:attributeMapping.title
                                                     rows:attributeMapping.selectValuesBlock(nil, self.object, &selectedIndex)
                                         initialSelection:selectedIndex
                                                doneBlock:done
                                              cancelBlock:nil
                                                   origin:self.tableView];
    
    picker.formAttributeMapping = attributeMapping;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)showSelectWithAttributeMapping:(BKFormAttributeMapping *)attributeMapping {
    BK_WEAK_IVAR BKFormModel *weakRef = self;
    
    [self.navigationController pushViewControllerWithBlock:^UIViewController *{
        NSInteger selectedIndex = 0;
        BWSelectViewController *vc = [[weakRef.selectControllerClass alloc] init];
        vc.items = attributeMapping.selectValuesBlock(nil, weakRef.object, &selectedIndex);
        vc.title = attributeMapping.title;
        vc.formAttributeMapping = attributeMapping;
        [vc setSlectedIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:selectedIndex inSection:0]]];
        
        [vc setDidSelectBlock:^(NSArray *selectedIndexPaths, BWSelectViewController *controller) {
            NSIndexPath *selectedIndexPath = [selectedIndexPaths lastObject];
            NSUInteger selectedIndex = selectedIndexPath.row;
            id selectedValue = [controller.items objectAtIndex:selectedIndex];
            BKFormAttributeMapping *formAttributeMapping = controller.formAttributeMapping;
            id value = formAttributeMapping.valueFromSelectBlock(selectedValue, self.object, selectedIndex);
            [weakRef.formMapper setValue:value forAttributeMapping:formAttributeMapping];
            [weakRef reloadRowWithAttributeMapping:formAttributeMapping];
            [controller.navigationController popViewControllerAnimated:YES];
        }];
        
        return vc;
    } animated:YES];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)showDatePickerWithAttributeMapping:(BKFormAttributeMapping *)attributeMapping {
    ActionSheetDatePicker *actionSheetPicker;
    UIDatePickerMode datePickerMode = UIDatePickerModeDate;
    
    if (BKFormAttributeMappingTypeTime == attributeMapping.type) {
        datePickerMode = UIDatePickerModeTime;
    } else if (BKFormAttributeMappingTypeDateTime == attributeMapping.type) {
        datePickerMode = UIDatePickerModeDateAndTime;
    }
    
    BK_WEAK_IVAR BKFormModel *weakRef = self;
    actionSheetPicker = [ActionSheetDatePicker showPickerWithTitle:attributeMapping.title
                                                    datePickerMode:datePickerMode
                                                      selectedDate:[NSDate date]
                                                         doneBlock:^(ActionSheetDatePicker *picker, NSDate *selectedDate, id origin) {
                                                             BKFormAttributeMapping *formAttributeMapping = picker.formAttributeMapping;
                                                             [weakRef.formMapper setValue:selectedDate forAttributeMapping:formAttributeMapping];
                                                             [weakRef reloadRowWithAttributeMapping:formAttributeMapping];
                                                         }
                                                       cancelBlock:nil
                                                            origin:self.tableView];
    
    actionSheetPicker.formAttributeMapping = attributeMapping;
}



@end
