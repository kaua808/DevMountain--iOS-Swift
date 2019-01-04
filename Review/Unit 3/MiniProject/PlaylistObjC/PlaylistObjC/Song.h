//
//  Song.h
//  PlaylistObjC
//
//  Created by Kaleo Kim on 4/21/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Playlist.h"

@interface Song : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *artistName;

- (instancetype)initWithName:(NSString *)title artist:(NSString *)artist;

@end
