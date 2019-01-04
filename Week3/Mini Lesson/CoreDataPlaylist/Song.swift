//
//  Song.swift
//  CoreDataPlaylist
//
//  Created by Kaleo Kim on 2/15/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation
import CoreData


class Song: NSManagedObject {

    convenience init(title: String, artist: String, playlist: Playlist, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Song", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.title = title
        self.artist = artist
        self.playlist = playlist
        
    }
    
    

}
