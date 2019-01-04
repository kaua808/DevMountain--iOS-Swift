//
//  StudentController.h
//  ObjectiveCPractice
//
//  Created by Kaleo Kim on 3/3/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface StudentController : NSObject

@property (strong, nonatomic) NSMutableArray *students;

+ (StudentController *)sharedInstance;

- (void)addStudents:(Student *)student;
- (void)removeStudents:(Student *)student;

@end
