//
//  Entry.h
//  JournalC
//
//  Created by Kaleo Kim on 3/3/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSDate *timeStamp;

@property (strong, nonatomic) NSDictionary *dictionaryCopy;


- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timeStamp:(NSDate *)timeStamp;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
