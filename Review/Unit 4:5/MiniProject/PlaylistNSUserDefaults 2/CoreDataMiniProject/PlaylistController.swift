//
//  PlaylistController.swift
//  CoreDataMiniProject
//
//  Created by Jordan Nelson on 2/13/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import CoreData

protocol PLaylistControllerDelegate: class {
    
    func updateUI()
    
}

class PlaylistController {
    
    private let kPlaylists = "playlists"
    
    static let sharedController = PlaylistController()
    weak var delegate: PLaylistControllerDelegate?
    
    var myPlaylists: [Playlist] = []
    
    init() {
        observePLaylists { (playlist) in
            self.myPlaylists = playlist
            self.delegate?.updateUI()
        }
    }
    
    func createPlaylist(name: String) {
        var playlist = Playlist(name: name)
        playlist.save()
        
    }
    
    // TEACHING NOTE: - deletes playlist from managed object context, after which you need to save to persistent store to make permanent
    func removePlaylist(playlist: Playlist) {
        if let index = myPlaylists.indexOf(playlist) {
            myPlaylists.removeAtIndex(index)
        }
        playlist.delete()
    }
    
    // TEACHING NOTE: - deleting a song from the managed object context automatically deletes it from the playlist because of the relationship we set up in the model
    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        if let index = playlist.songs.indexOf(song) {
            playlist.songs.removeAtIndex(index)
        }
        song.delete()
    }
    
    // TEACHING NOTE: - initializing a song automatically adds it to a playlist because of the relationship we set up in the model
    func addSongToPlaylist(title: String, artist: String, playlist:Playlist) {
        var song = Song(title: title, artist: artist, playlist: playlist)
        song.save()
        
    }
    
    func observePLaylists(completion: (playlist: [Playlist]) -> Void) {
        FirebaseController.base.childByAppendingPath("users/\(UserController.currentUser?.identifier ?? "")/playlists").observeEventType(.Value, withBlock: { (data) in
            guard let value = data.value as? [String: [String:AnyObject]] else {
                completion(playlist: [])
                return
            }
            let playlist = value.flatMap({Playlist(json: $1, identifier: $0)})
            completion(playlist: playlist)
        })
        
    }
    
    static func observePlaylistForIdentifier(identifier: String, completion: (playlist: Playlist?) -> Void) {
        
        FirebaseController.base.childByAppendingPath("users/\(UserController.currentUser?.identifier ?? "")/playlists/\(identifier)").observeEventType(.Value, withBlock: { (data) in
            guard let value = data.value as? [String: AnyObject] else { completion(playlist: nil); return }
            let playlist = Playlist(json: value, identifier: identifier)
            completion(playlist: playlist)
        })
    }
}




