//
//  Task+CoreDataProperties.swift
//  Task
//
//  Created by Kaleo Kim on 4/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var name: String?
    @NSManaged var dueDate: NSDate?
    @NSManaged var notes: String?
    @NSManaged var isComplete: NSNumber?

}
