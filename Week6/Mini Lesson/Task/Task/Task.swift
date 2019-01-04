//
//  Task.swift
//  Task
//
//  Created by Caleb Hicks on 10/21/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import CoreData

@objc(Task)
class Task: NSManagedObject {
    
    convenience init(name: String, notes: String? = nil, due: NSDate? = nil, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = false
    }

}
