//
//  Student.m
//  ObjectiveCPractice
//
//  Created by James Pacheco on 3/3/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface Student ()

@end

@implementation Student

-(instancetype)initWithName:(NSString *)name age:(NSString *)age
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}

@end

