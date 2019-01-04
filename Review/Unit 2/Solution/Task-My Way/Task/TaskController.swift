//
//  TaskController.swift
//  Task
//
//  Created by Kaleo Kim on 4/14/16.
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
        
        let filteredTasks = tasks?.filter{$0.isComplete.boolValue == false}
        
        return filteredTasks ?? []
        
    }
    
    //create Task
    
    func addNewTask(task: Task) {
        
        saveToPersistentStorage()
        
    }
    
    //saveToPersistentStore
    
    func saveToPersistentStorage() {
        
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
}