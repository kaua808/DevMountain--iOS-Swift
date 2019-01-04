//
//  PlaylistController.swift
//  PlaylistMiniProject
//
//  Created by Parker Donat on 4/6/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class PlaylistController {
    
    static let kPlaylist = "playlists"
    
//    static let sharedInstance = PlaylistController()
    
    static var playlists: [Playlist] = []
//    static var playlists: [Playlist] = [Playlist(name: "Tap this playlist", songs: [Song(name: "New Song", artist: "Someone")])]
    
    
    
    //[Playlist(name: "This Rocks"), songs: [Song(name: "Something", artist: "Someone")]),  Playlist(name: "Classic Rock")]
    
    // create a playlist
    static func createPlaylist(name: String) {
        let newPlaylist = Playlist(name: name)
        playlists.append(newPlaylist)
    }
    
    // delete a playlist
    static func deletePlaylist(playlist: Playlist) {
        
    }
    
    // update a playlist
    static func updatePlaylist(playlist:Playlist, song: [Song], name: String) {
        
    }
    
    static func saveToPersistantStore() {
        //let playlistDictionaries = playlists.map({$0.dictionaryCopy})
        
        //either the top or bottom ones work
        
        var playlistDictionaryArray: [[String: AnyObject]] = []
        
        for playlist in playlists {
            let playlistDictionary = playlist.dictionaryCopy
            playlistDictionaryArray.append(playlistDictionary)
        }
        
        
        NSUserDefaults.standardUserDefaults().setObject(playlistDictionaryArray, forKey: kPlaylist)
    }
    
    static func loadFromPersistantStoe() {
        if let playlistDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kPlaylist) as? [[String: AnyObject]] {
            
            var playlistArray: [Playlist] = []
            for playlistDictionary in playlistDictionaryArray {
                if let playlist = Playlist(dictionary: playlistDictionary) {
                    playlistArray.append(playlist)
                }
            }
            self.playlists = playlistArray
        }
    }
    
}