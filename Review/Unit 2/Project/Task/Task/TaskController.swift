//
//  TaskController.swift
//  Task
//
//  Created by Kaleo Kim on 4/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let sharedController = TaskController()
    
    var tasks: [Task] {
        
        let context = Stack.sharedStack.managedObjectContext
        let request = NSFetchRequest(entityName: "Task")
        let tasks = (try? context.executeFetchRequest(request)) as? [Task]
        
        return tasks ?? []
        
    }
    
    // add
    
    func addTask(task: Task) {
        saveToPersistentStorage()
    }
    
    // save
    func saveToPersistentStorage() {
        
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("unable to save task")
        }
        
    }
    
}