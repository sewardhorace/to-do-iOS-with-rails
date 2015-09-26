//
//  ToDoItem.m
//  ToDoListAPI
//
//  Created by Max White on 9/25/15.
//  Copyright © 2015 Max White. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

-(id)init{
    self = [super init];
    if (self) {
        // Any custom setup work goes here
        _title = @"(no title set)";
        _descript = @"(no description set)";
        _dueDate = [[NSDate alloc] init];
        _priority = 0;
        _completed = false;
    }
    return self;
}


@end
