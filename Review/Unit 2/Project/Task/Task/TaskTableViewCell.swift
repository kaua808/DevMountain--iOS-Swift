//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Kaleo Kim on 4/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet var taskNameLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    var task: Task?
    
    var delegate: TaskTableViewCellDelegate?

    @IBAction func doneButtonTapped(sender: AnyObject) {
        
        if let delegate = delegate {
            delegate.doneButtonTapped(self)
        }
        
    }
    
    func updateWithTask(task: Task) {
        
        taskNameLabel.text = task.name
        
        if task.isComplete == false {
            doneButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        } else {
            doneButton.setImage(UIImage(named: "complete"), forState: .Normal)
        }
        
    }
}

protocol TaskTableViewCellDelegate {
    
    func doneButtonTapped(cell: TaskTableViewCell)
    
}

