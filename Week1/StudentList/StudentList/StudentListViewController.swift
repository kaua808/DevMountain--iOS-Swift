//
//  ViewController.swift
//  StudentList
//
//  Created by Kaleo Kim on 2/4/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension StudentListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return StudentController.sharedInstance.students.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("studentCell", forIndexPath: indexPath)
        
        let student = StudentController.sharedInstance.students[indexPath.row]
        
        cell.textLabel?.text = student.name
        cell.detailTextLabel?.text = student.phoneNumber
        
        return cell
    }
    
}
