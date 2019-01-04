//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Kaleo Kim on 4/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet var taskNameTextField: UITextField!
    @IBOutlet var dueDateTextField: UITextField!
    @IBOutlet var notesTextField: UITextView!
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskNameTextField.delegate = self
        dueDateTextField.delegate = self
        notesTextField.delegate = self
        
        if let task = task {
            updateWithTask(task)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dueDateTextFieldTapped(sender: UITextField) {
        
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        datePickerView.minimumDate = NSDate()
        
        sender.inputView = datePickerView
        sender.inputAccessoryView = doneButtonToolbar(sender)
        
        datePickerView.addTarget(self, action: #selector(handleDatePicker), forControlEvents: UIControlEvents.ValueChanged)
        
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        dueDateTextField.text = dateFormatter.stringFromDate(currentDate)
        
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dueDateTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    func doneButtonToolbar(textField: UITextField) -> UIView {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let cancel = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(cancelTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(doneTapped))
        toolBar.setItems([cancel, spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        return toolBar
    }
    
    func cancelTapped() {
        
        dueDateTextField.text = ""
        
        dueDateTextField.resignFirstResponder()
        
    }
    
    func doneTapped() {
        
        dueDateTextField.resignFirstResponder()
        
    }

    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        let name = taskNameTextField.text
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let date = dateFormatter.dateFromString(self.dueDateTextField.text!)
        
        let notes = notesTextField.text
        
        if let task = task {
            
            task.name = name
            task.dueDate = date
            task.notes = notes
            
        } else {
            
            let newTask = Task(name: name!, dueDate: date, notes: notes)
            TaskController.sharedController.addTask(newTask)
        }
        navigationController?.popViewControllerAnimated(true)
        
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    

    func updateWithTask(task: Task) {
        
        taskNameTextField.text = task.name
        
        if let due = task.dueDate {
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            let dateString = dateFormatter.stringFromDate(due)
            
            dueDateTextField.text = dateString
            
        }
        
        if let notes = task.notes {
            notesTextField.text = notes
        }
        
    }


}
