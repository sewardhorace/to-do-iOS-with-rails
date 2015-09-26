//
//  ToDoItem.h
//  ToDoListAPI
//
//  Created by Max White on 9/25/15.
//  Copyright © 2015 Max White. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property (nonatomic) NSString *toDoID;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *descript;
@property (nonatomic) NSDate *dueDate;
@property (nonatomic) NSInteger *priority;
@property (nonatomic) BOOL *completed;

@end
