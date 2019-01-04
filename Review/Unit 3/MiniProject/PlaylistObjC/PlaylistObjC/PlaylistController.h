//
//  PlaylistController.h
//  PlaylistObjC
//
//  Created by Kaleo Kim on 4/21/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"
#import "Playlist.h"

@interface PlaylistController : NSObject

@property (strong, nonatomic) NSMutableArray *playlist;

- (void)createPlayListWithTitle:(NSString *)title;
- (void)addSongWithTitle:(NSString *)title andArtist:(NSString *)artist toPLaylist:(Playlist *)playlist;
- (void)seleteSong:(Song *)song fromPLaylist:(Playlist *)playlist;
- (void)deletePlaylist:(Playlist *)playlist;

+ (PlaylistController *)sharedInstance;
-(instancetype)init;

@end
