//
//  Playlist.h
//  PlaylistObjC
//
//  Created by Kaleo Kim on 4/21/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"

@interface Playlist : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray *songs;

-(instancetype)initWithTitle:(NSString *)title songs:(NSMutableArray *)songs;

@end
