//
//  ToDoItemViewController.m
//  ToDoListAPI
//
//  Created by Max White on 9/25/15.
//  Copyright © 2015 Max White. All rights reserved.
//

#import "ToDoItemViewController.h"

@interface ToDoItemViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;

@end

@implementation ToDoItemViewController

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
