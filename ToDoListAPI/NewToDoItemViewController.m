//
//  NewToDoItemViewController.m
//  ToDoListAPI
//
//  Created by Max White on 9/26/15.
//  Copyright © 2015 Max White. All rights reserved.
//

#import "NewToDoItemViewController.h"
#import "ToDoItem.h"
#import "ToDoListTableViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface NewToDoItemViewController ()

@property (nonatomic)ToDoItem *todo;


@property (weak, nonatomic) IBOutlet UILabel *successLabel;
@property (nonatomic) UIColor *errorColor;
@property (nonatomic) UIColor *successColor;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation NewToDoItemViewController

-(void)successMessageWithText:(NSString *)message{
    self.successLabel.text = message;
    self.successLabel.textColor = self.successColor;
    [self.successLabel setHidden:false];
}
-(void)errorMessageWithText:(NSString *)message{
    self.successLabel.text = message;
    self.successLabel.textColor = self.errorColor;
    [self.successLabel setHidden:false];
}
-(void)clearFields{
    self.titleTextField.text = @"";
    self.descriptionTextField.text = @"";
}

-(void)makeNewToDoItemPOSTRequestWithToDO:(ToDoItem *)todo{
    
    NSString *dateString = [NSString stringWithFormat:@"%@", self.todo.dueDate];
    
    NSDictionary *toDoParams = @{
                           @"title" : self.todo.title,
                           @"description" : self.todo.descript,
                           @"due_date" : dateString
                           };
    
    NSDictionary *toDoDictionary = @{@"to_do":toDoParams};
    
//    NSString *urlString = @"http://localhost:3000/api/v1/to_dos.json";
    NSString *urlString = @"http://infinite-earth-8625.herokuapp.com/api/v1/to_dos.json";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:urlString parameters:toDoDictionary success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"success! Object: %@", responseObject);
        [self successMessageWithText:@"Saved!"];
        [self clearFields];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@", error);
        [self errorMessageWithText:@"Error: Failed to Save"];
    }];
}

- (IBAction)doneButtonTapped:(id)sender {
    NSLog(@"done button tapped");
    
    if (self.titleTextField.text.length > 2){
        
        self.todo.title = self.titleTextField.text;
        self.todo.descript = self.descriptionTextField.text;
        self.todo.dueDate = self.datePicker.date;
        [self makeNewToDoItemPOSTRequestWithToDO:self.todo];
        
    } else {
        [self errorMessageWithText:@"Must have a Title with at least 3 characters."];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.errorColor = [UIColor redColor];
    self.successColor = [UIColor greenColor];
    [self.successLabel setHidden:true];
    
    self.todo = [[ToDoItem alloc] init];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ToDoListTableViewController *viewController = [segue destinationViewController];
    [viewController.tableView reloadData];
}


@end
