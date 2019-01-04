//
//  PlaylistController.swift
//  CoreDataPlaylist
//
//  Created by Kaleo Kim on 2/15/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let sharedInstance = PlaylistController()
    
    var playlists: [Playlist]? {
        let request = NSFetchRequest(entityName: "Playlist")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        return try? moc.executeFetchRequest(request) as! [Playlist]
        
//        do {
//            return try moc.executeFetchRequest(request) as! [Playlist]
//        } catch {
//            return []
//        }
    }
    
    //create playlist
    func createPlaylist(name: String) {
        _ = Playlist(name: name)
        saveToPersistentStore()
    }
    
    //remove playlist
    func removePlaylist(playlist: Playlist) -> () {
        if let moc = playlist.managedObjectContext {
            moc.deleteObject(playlist)
            saveToPersistentStore()
        }
    }
    
    //save core data
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving \(error)")
        }
    }
    
    // MARK: - Songs
    
    // create song
    func createSong(title: String, artist: String, playlist: Playlist) {
        
        _ = Song(title: title, artist: artist, playlist: playlist)
        
        saveToPersistentStore()
    }
    
    // remove song
    func removeSong(song: Song) -> () {
        if let moc = song.managedObjectContext {
            moc.deleteObject(song)
            saveToPersistentStore()
        }
    }
    
    
    
}
