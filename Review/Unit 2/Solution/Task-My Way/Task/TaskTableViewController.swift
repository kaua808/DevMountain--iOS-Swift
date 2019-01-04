//
//  TaskTableViewController.swift
//  Task
//
//  Created by Kaleo Kim on 4/14/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController, TaskTableViewCellDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
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
        

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetail" {
            let taskDetailViewController = segue.destinationViewController as! TaskDetailTableViewController
            
            if let cell = sender as? UITableViewCell,
                indexPath = tableView.indexPathForCell(cell) {
                let task = TaskController.sharedController.tasks[indexPath.row]
                taskDetailViewController.task = task
            }
        }

    }
    
    func completeButtonTapped(sender: TaskTableViewCell) {
        let indexPath = tableView.indexPathForCell(sender)!
        
        let task = TaskController.sharedController.tasks[indexPath.row]
        task.isComplete = !task.isComplete.boolValue
        TaskController.sharedController.saveToPersistentStorage()
        
        tableView.reloadData()
    }
    
    
    
 

}





