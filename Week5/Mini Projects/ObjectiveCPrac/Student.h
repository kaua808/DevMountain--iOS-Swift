//
//  Student.h
//  ObjectiveCPractice
//
//  Created by Kaleo Kim on 3/3/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *age;

- (instancetype)initWithName: (NSString *)name age:(NSString *)age;

@end
