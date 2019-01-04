//
//  Playlist.swift
//  PlaylistMiniProject
//
//  Created by Kaleo Kim on 4/14/16.
//  Copyright © 2016 Brock. All rights reserved.
//

import Foundation
import CoreData


class Playlist: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init(name: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Playlist", in: context)!
        
        self.init(entity: entity, insertInto: context)
        self.name = name
    }
}
