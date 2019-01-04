//
//  Song.swift
//  PlaylistMiniProject
//
//  Created by Kaleo Kim on 4/14/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import Foundation
import CoreData


class Song: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init(title: String, artist: String, playlist: Playlist, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Song", in: context)!
        
        self.init(entity: entity, insertInto: context)
        self.title = title
        self.artist = artist
        self.playlist = playlist
    }
}
