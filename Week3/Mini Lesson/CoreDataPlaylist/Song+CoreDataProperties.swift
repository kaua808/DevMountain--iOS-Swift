//
//  Song+CoreDataProperties.swift
//  CoreDataPlaylist
//
//  Created by Kaleo Kim on 2/15/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Song {

    @NSManaged var title: String?
    @NSManaged var artist: String?
    @NSManaged var playlist: Playlist?

}
