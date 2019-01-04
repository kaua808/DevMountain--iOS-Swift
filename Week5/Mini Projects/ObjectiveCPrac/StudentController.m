//
//  StudentController.m
//  ObjectiveCPractice
//
//  Created by Kaleo Kim on 3/3/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "StudentController.h"

@implementation StudentController

+ (StudentController *)sharedInstance {
    static StudentController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [StudentController new];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.students = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addStudents:(Student *)student {
    
    [self.students addObject:student];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"studentAdded" object:self];
    
}

-(void)removeStudents:(Student *)student {
    
    [self.students removeObject:student];
    
}

@end
