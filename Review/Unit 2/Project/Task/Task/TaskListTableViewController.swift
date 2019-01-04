//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Kaleo Kim on 4/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, TaskTableViewCellDelegate {

    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.sharedController.tasks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! TaskTableViewCell
        
        let task = TaskController.sharedController.tasks[indexPath.row]
        
        cell.updateWithTask(task)
        cell.delegate = self

        // Configure the cell...

        return cell
    }
    
    // Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toDetail" {
            
            if let cell = sender as? UITableViewCell, indexPath = tableView.indexPathForCell(cell) {
                
                let detailTaskView = segue.destinationViewController as! TaskDetailTableViewController
                
                let task = TaskController.sharedController.tasks[indexPath.row]
                
                detailTaskView.task = task
                
            }
        }
    }
    
    func doneButtonTapped(cell: TaskTableViewCell) {
        
        let indexPath = tableView.indexPathForCell(cell)!
        
        let task = TaskController.sharedController.tasks[indexPath.row]
        task.isComplete = !task.isComplete!.boolValue
        TaskController.sharedController.saveToPersistentStorage()
        
        tableView.reloadData()
        
    }
 
    
    
    
    
    
    
    
    
    

    
}
