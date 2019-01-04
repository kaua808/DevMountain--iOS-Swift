//
//  Entry.m
//  JournalC
//
//  Created by Kaleo Kim on 3/3/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "Entry.h"

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"text";
static NSString * const TimeStampKey = @"timeStamp";

@implementation Entry

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timeStamp:(NSDate *)timeStamp {
    
    self = [super init];
    if (self){
        _title = title;
        _text = text;
        _timeStamp = timeStamp;
        
    }
    return self;
    
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self){
        
        _title = dictionary[TitleKey];
        _text = dictionary[TextKey];
        _timeStamp = dictionary[TimeStampKey];
        
    }
    return self;
    
}

- (NSDictionary *)dictionaryCopy {
    return @ {
        TitleKey: self.title,
        TextKey: self.text,
        TimeStampKey: self.timeStamp
    };
}


@end
