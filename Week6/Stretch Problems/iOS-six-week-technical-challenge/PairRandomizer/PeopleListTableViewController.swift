//
//  PeopleListTableViewController.swift
//  PairRandomizer
//
//  Created by Kaleo Kim on 3/11/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class PeopleListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    @IBAction func addPersonButtonTapped(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        let save = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) { (action) -> Void in
            if let textFields = alert.textFields,
                let name = textFields[0].text {
                    
                    let newPerson = Person(name: name)
                    PersonController.sharedInstance.addPerson(newPerson)
                    self.tableView.reloadData()
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(save)
        
        alert.addTextFieldWithConfigurationHandler { (nameField) -> Void in
            nameField.placeholder = "Name..."
        }
        presentViewController(alert, animated: true, completion: nil)
        
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PersonController.sharedInstance.people.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("personCell", forIndexPath: indexPath)

        let person = PersonController.sharedInstance.people[indexPath.row]

        cell.textLabel?.text = person.name
        
        return cell
    }
    
    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "nameDetail" {
            let nameDetail = segue.destinationViewController as! NameDetailViewController
            
            if let cell = sender as? UITableViewCell, indexPath = tableView.indexPathForCell(cell) {
                let name = PersonController.sharedInstance.people[indexPath.row]
                nameDetail.person = name
            }
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            PersonController.sharedInstance.people.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            PersonController.sharedInstance.saveToPersistentStorage()
        }
    }

}
