//
//  ToDoListTableViewController.m
//  ToDoListAPI
//
//  Created by Max White on 9/25/15.
//  Copyright © 2015 Max White. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItemViewController.h"
#import "ToDoItem.h"
#import <AFNetworking/AFNetworking.h>

@interface ToDoListTableViewController ()

@property (nonatomic) NSArray *toDoListData;

@end

@implementation ToDoListTableViewController

-(void)loadToDoData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *URLString = @"http://infinite-earth-8625.herokuapp.com/to_dos";
//    NSString *URLString = @"http://0.0.0.0:3000/to_dos.json";
    
    [manager GET:URLString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        self.toDoListData = [NSArray arrayWithArray:responseObject];
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@", error);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self loadToDoData]; //also called in viewWillAppear
}
-(void)viewWillAppear:(BOOL)animated{
    [self loadToDoData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDoListData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell" forIndexPath:indexPath];

    NSDictionary *result = [self.toDoListData objectAtIndex:indexPath.row];
    
    NSString *title = [result objectForKey:@"title"];

    
    ToDoItem *todo = [[ToDoItem alloc] init];
    
    todo.title = title;
    
    cell.textLabel.text = todo.title;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ToDoItemViewController *viewController = [segue destinationViewController];
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSDictionary *result = [self.toDoListData objectAtIndex:indexPath.row];
    
    NSString *toDoID = [result objectForKey:@"id"];
    NSString *title = [result objectForKey:@"title"];
    NSString *descript = [result objectForKey:@"description"];
    NSDate *dueDate = [result objectForKey:@"due_date"];
//    NSInteger *priority = [result objectForKey:@"priority"];
    
    ToDoItem *todo = [[ToDoItem alloc] init];
    todo.toDoID = toDoID;
    todo.title = title;
    if (descript) {
       todo.descript = descript;
    }
    if (dueDate) {
        todo.dueDate = dueDate;
    }
    viewController.todo = todo;
}

@end
