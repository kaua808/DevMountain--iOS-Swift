//
//  PlaylistController.m
//  PlaylistObjC
//
//  Created by Kaleo Kim on 4/21/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import "PlaylistController.h"


@implementation PlaylistController

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        self.playlist = [[NSMutableArray alloc] init];
    }
    
    return self;
    
}

+ (PlaylistController *)sharedInstance {
    static PlaylistController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PlaylistController new];
    });
    return sharedInstance;
}

- (void)createPlayListWithTitle:(NSString *)title {
    
    Playlist *playlist = [[Playlist alloc] initWithTitle:title songs:[[NSMutableArray alloc] init]];
    [self.playlist addObject:playlist];
    
}

- (void)addSongWithTitle:(NSString *)title andArtist:(NSString *)artist toPLaylist:(Playlist *)playlist {
    
    Song *song = [[Song alloc] initWithName:title artist:artist];
    
    [playlist.songs addObject:song];
    
}

- (void)seleteSong:(Song *)song fromPLaylist:(Playlist *)playlist {

    [playlist.songs removeObject:song];
    
}

- (void)deletePlaylist:(Playlist *)playlist {
    
    [self.playlist removeObject:playlist];
    
}

@end
