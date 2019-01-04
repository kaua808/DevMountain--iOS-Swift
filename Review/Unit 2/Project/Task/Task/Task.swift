//
//  Task.swift
//  Task
//
//  Created by Kaleo Kim on 4/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class Task: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init(name: String, dueDate: NSDate? = nil, notes: String? = nil, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.dueDate = dueDate
        self.notes = notes
        self.isComplete = false
        
    }

}
