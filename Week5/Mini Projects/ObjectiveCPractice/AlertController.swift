//
//  AlertController.swift
//  ObjectiveCPractice
//
//  Created by James Pacheco on 3/3/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit


public class AlertController: NSObject {
    static public func addStudentAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Please add a student", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "name"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "age"
        }
        let addAction = UIAlertAction(title: "Add Student", style: .Default) { (action) -> Void in
            let name = alert.textFields?.first?.text ?? ""
            let age = alert.textFields?.last?.text ?? ""
            let student = Student(name: name, age: age)
            StudentController.sharedInstance().addStudent(student)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        return alert
    }
    
}