//
//  Student.h
//  ObjectiveCPractice
//
//  Created by James Pacheco on 3/3/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;

- (instancetype)initWithName:(NSString *)name age:(NSString *)age;

@end
