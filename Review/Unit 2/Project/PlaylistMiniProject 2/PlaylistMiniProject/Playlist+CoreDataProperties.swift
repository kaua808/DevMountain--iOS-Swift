//
//  Playlist+CoreDataProperties.swift
//  PlaylistMiniProject
//
//  Created by Kaleo Kim on 4/14/16.
//  Copyright © 2016 Brock. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Playlist {

    @NSManaged var name: String
    @NSManaged var song: NSSet

}
