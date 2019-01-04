//
//  TableViewController.swift
//  ChatStretch
//
//  Created by James Pacheco on 3/7/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UITableViewController {
    
    let firebase = Firebase(url:"authentication123.firebaseIO.com")

    let currentUserID = "f4284d8b-af15-4827-995a-ff14bc2a8ab8"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebase.childByAppendingPath("users/\(currentUserID)").observeSingleEventOfType(.Value, withBlock: { (data) -> Void in
            if let data = data.value as? [String: AnyObject] {
                if let groupsDictionary = data["groups"] as? [String:  AnyObject] {
                    let groups = groupsDictionary.keys
                    for groupID in groups {
                        self.firebase.childByAppendingPath("groups/\(groupID)").observeSingleEventOfType(.Value, withBlock: { (data) -> Void in
                            if let data = data.value as? [String: AnyObject] {
                                print(groupID)
                                print(data)
                            }
                        })
                    }
                }
                
            }
        })
        
    }

    // MARK: - Table view data source

   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
