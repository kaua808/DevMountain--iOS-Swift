//
//  Song.m
//  PlaylistObjC
//
//  Created by Kaleo Kim on 4/21/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "Song.h"

@implementation Song

-(instancetype)initWithName:(NSString *)name artist:(NSString *)artist {
    
    self = [super init];
    if (self) {
        self.name = name;
        self.artistName = artist;
    }
    return self;
    
}

@end
