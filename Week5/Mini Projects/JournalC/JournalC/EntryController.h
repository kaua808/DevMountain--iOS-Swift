//
//  EntryController.h
//  Journal-C
//
//  Created by Caleb Hicks on 12/1/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (strong, nonatomic) NSMutableArray *entries;

- (void)addEntry:(Entry *)entry;
- (void)removeEntry:(Entry *)entry;

+ (EntryController *)sharedController;

@end
