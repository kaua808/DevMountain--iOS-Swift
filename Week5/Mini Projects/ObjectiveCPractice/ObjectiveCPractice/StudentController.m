//
//  StudentController.m
//  ObjectiveCPractice
//
//  Created by James Pacheco on 3/3/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentController.h"

@implementation StudentController

+ (StudentController *)sharedInstance
{
    static StudentController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [StudentController new];
    });
    return sharedInstance;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.students = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addStudent:(Student *)student
{
    [self.students addObject:student];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"studentAdded" object:self];
}

- (void)removeStudent:(Student *)student
{
    [self.students removeObject:student];
}

@end