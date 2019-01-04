//
//  SongController.swift
//  PlaylistMiniProject
//
//  Created by Parker Donat on 4/6/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class SongController {
    
    static func addSongToPlaylist(song: Song, playlist: Playlist) {
        
        playlist.songs.append(song)
        
    }
    
    static func createSong(name: String, artist: String) -> Song {
        
        return Song(name: name, artist: artist)
        
    }
    
    static func deleteSongFromPlaylist(song: Song, playlist: Playlist) {
        
    }
    
}