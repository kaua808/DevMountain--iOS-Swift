//
//  Playlist.m
//  PlaylistObjC
//
//  Created by Kaleo Kim on 4/21/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "Playlist.h"

@implementation Playlist

-(instancetype)initWithTitle:(NSString *)title songs:(NSMutableArray *)songs {
    
    self = [super init];
    if (self) {
        self.title = title;
        self.songs = songs;
    }
    return self;
}

@end
