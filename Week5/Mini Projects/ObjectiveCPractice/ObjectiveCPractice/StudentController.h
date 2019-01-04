//
//  StudentController.h
//  ObjectiveCPractice
//
//  Created by James Pacheco on 3/3/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface StudentController : NSObject

@property (nonatomic, strong) NSMutableArray *students;

+ (StudentController *)sharedInstance;

- (void)addStudent:(Student *)student;

- (void)removeStudent:(Student *)student;

@end
