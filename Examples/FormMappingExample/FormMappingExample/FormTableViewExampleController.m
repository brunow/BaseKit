//
//  FormTableViewController.m
//  FormMappingExample
//
//  Created by Bruno Wernimont on 11/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FormTableViewExampleController.h"

#import "BaseKitFormModel.h"

#import "Movie.h"
#import "Comment.h"
#import "Genre.h"
#import "BWLongTextViewController.h"

@implementation FormTableViewExampleController

@synthesize formModel;
@synthesize movie = _movie;

#pragma mark - View lifecycle


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
    }
    return self;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.formModel = [BKFormModel formTableModelForTableView:self.tableView navigationController:self.navigationController];
    
    Movie *movie = [Movie movieWithTitle:@"Star Wars: Episode VI - Return of the Jedi"
                                 content:@"After rescuing Han Solo from the palace of Jabba the Hutt, the Rebels attempt to destroy the Second Death Star, while Luke Skywalker tries to bring his father back to the Light Side of the Force."];
    
    movie.shortName = @"SWEVI";
    movie.suitAllAges = [NSNumber numberWithBool:YES];
    movie.numberOfActor = [NSNumber numberWithInt:4];
    movie.genre = [Genre genreWithName:@"Action"];
    movie.releaseDate = [NSDate date];
    movie.rate = [NSNumber numberWithFloat:5];
    
    self.movie = movie;
    
    [BKFormMapping mappingForClass:[Movie class] block:^(BKFormMapping *formMapping) {
        [formMapping sectiontTitle:@"Header" footer:@"Footer" identifier:@"info"];
        [formMapping mapAttribute:@"title" title:@"Title" type:BKFormAttributeMappingTypeText];
        [formMapping mapAttribute:@"releaseDate" title:@"ReleaseDate" type:BKFormAttributeMappingTypeDate dateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [formMapping mapAttribute:@"suitAllAges" title:@"All ages" type:BKFormAttributeMappingTypeBoolean];
        [formMapping mapAttribute:@"shortName" title:@"ShortName" type:BKFormAttributeMappingTypeLabel];
        [formMapping mapAttribute:@"numberOfActor" title:@"Number of actor" type:BKFormAttributeMappingTypeInteger];
        [formMapping mapAttribute:@"content" title:@"Content" type:BKFormAttributeMappingTypeBigText];
        [formMapping mapAttribute:@"rate" title:@"Rate" type:BKFormAttributeMappingTypeSlider minValue:0 maxValue:10];
        
        [formMapping mapAttribute:@"choice" title:@"Choices" showInPicker:NO selectValuesBlock:^NSArray *(id value, id object, NSInteger *selectedValueIndex){
            *selectedValueIndex = 1;
            return [NSArray arrayWithObjects:@"choice1", @"choice2", nil];
        } valueFromSelectBlock:^id(id value, id object, NSInteger selectedValueIndex) {
            return value;
        } labelValueBlock:^id(id value, id object) {
            return value;
        }];
        
        [formMapping sectiontTitle:@"Custom cells" identifier:@"customCells"];
        
        [formMapping mapCustomCell:[UITableViewCell class]
                        identifier:@"custom"
                         rowHeight:70
              willDisplayCellBlock:^(UITableViewCell *cell, id object, NSIndexPath *indexPath) {
                  cell.textLabel.text = @"I am a custom cell !";
                  
              }     didSelectBlock:^(UITableViewCell *cell, id object, NSIndexPath *indexPath) {
                  NSLog(@"You pressed me");
                  
              }];
        
        [formMapping mapCustomCell:[UITableViewCell class]
                        identifier:@"custom2"
              willDisplayCellBlock:^(UITableViewCell *cell, id object, NSIndexPath *indexPath) {
                  cell.textLabel.text = @"I am a custom cell too !";
                  
              }     didSelectBlock:^(UITableViewCell *cell, id object, NSIndexPath *indexPath) {
                  NSLog(@"You pressed me");
                  
              }];
        
        [formMapping sectiontTitle:@"Buttons" identifier:@"saveButton"];
        
        [formMapping buttonSave:@"Save" handler:^{
            NSLog(@"save pressed");
            NSLog(@"%@", self.movie);
            [self.formModel save];
        }];
        
        [self.formModel registerMapping:formMapping];
    }];
    
    [self.formModel loadFieldsWithObject:movie];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.formModel = nil;
    self.movie = nil;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}


@end
