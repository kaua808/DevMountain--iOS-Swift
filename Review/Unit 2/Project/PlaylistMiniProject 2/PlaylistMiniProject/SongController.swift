//
//  SongController.swift
//  PlaylistMiniProject
//
//  Created by admin on 4/6/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    static func createSong(_ title: String, artist: String, playlist: Playlist) {
        let _ = Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.sharedController.saveToPersistentStore()
    }
}
