//
//  Student.m
//  ObjectiveCPractice
//
//  Created by Kaleo Kim on 3/3/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName: (NSString *)name age:(NSString *)age; {
    
    self = [super init];
    if(self) {
        _name = name;
        _age = age;
    }
    
    return self;
}

@end
