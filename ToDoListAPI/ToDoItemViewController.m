//
//  ToDoItemViewController.m
//  ToDoListAPI
//
//  Created by Max White on 9/25/15.
//  Copyright © 2015 Max White. All rights reserved.
//

#import "ToDoItemViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface ToDoItemViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;

@end

@implementation ToDoItemViewController

-(void)deleteToDoItem{
    
    NSString *URLString = [NSString stringWithFormat:@"http://infinite-earth-8625.herokuapp.com/to_dos/%@.json",self.todo.toDoID];
    
//    NSString *URLString = [NSString stringWithFormat:@"http://0.0.0.0:3000/to_dos/%@.json", self.todo.toDoID];
    
    NSLog(@"URL: %@", URLString);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager DELETE:URLString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"Success! Response: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
}

- (IBAction)deleteButtonTapped:(id)sender {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Delete ToDo"
        message:@"Are you sure you want to delete?"
        preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* acceptAction = [UIAlertAction
        actionWithTitle:@"Yes"
        style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * action) {
            NSLog(@"action: %@", action);
            [self deleteToDoItem];
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }];
    
    UIAlertAction* cancelAction = [UIAlertAction
        actionWithTitle:@"No"
        style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * action) {
            NSLog(@"action: %@", action);
        }];
    
    [alert addAction:acceptAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = self.todo.title;
    
//    if (self.todo.descript != NULL){
//        self.descriptionLabel.text = self.todo.descript;
//    } else {
//        self.descriptionLabel.text = @"(none)";
//    }
//    
//    if (self.todo.dueDate != NULL){
//        self.dueDateLabel.text = [NSString stringWithFormat:@"%@",self.todo.dueDate];
//    } else {
//        self.dueDateLabel.text = @"(none set)";
//    }
    
}


@end
