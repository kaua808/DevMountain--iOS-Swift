//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Kaleo Kim on 4/14/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet var taskNameLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    var delegate: TaskTableViewCellDelegate?
    
    var task: Task?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func doneButtonTapped(sender: AnyObject) {
        
        if let delegate = delegate {
            delegate.completeButtonTapped(self)
        }
        
    }
    
    func updateWithTask(task: Task) {
        
        taskNameLabel.text = task.name
    
    }
    
}

protocol TaskTableViewCellDelegate {
    
    func completeButtonTapped(sender: TaskTableViewCell)
    
}





























