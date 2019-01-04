//
//  PlaylistController.swift
//  PlaylistMiniProject
//
//  Created by admin on 4/6/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let sharedController = PlaylistController()
    
    var playlists: [Playlist] {
        
        let context = Stack.sharedStack.managedObjectContext
        let request = NSFetchRequest(entityName: "Playlist")
        let playlists = (try? context.fetch(request)) as? [Playlist]
        
        return playlists ?? []
        
    }
    
    func createPlaylist(_ name: String) {
        
        let _ = Playlist(name: name)
        saveToPersistentStore()
        
    }
    
    func saveToPersistentStore() {
        let _ = try? Stack.sharedStack.managedObjectContext.save()
    }
    
    func deletePlaylist(_ playlist: Playlist) {
        let _ = Stack.sharedStack.managedObjectContext.delete(playlist)
    }
    


}
