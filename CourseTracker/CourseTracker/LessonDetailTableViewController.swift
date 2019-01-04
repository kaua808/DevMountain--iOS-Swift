//
//  LessonDetailTableViewController.swift
//  CourseTracker
//
//  Created by Kaleo Kim on 2/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LessonDetailTableViewController: UITableViewController, ObjectiveTableViewCellDelegate {
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var studentsNoteLabel: UILabel!
    
    var lesson: Lesson?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if let lesson = lesson {
            
            title = lesson.name
         
            descriptionLabel.text = lesson.description
            studentsNoteLabel.text = lesson.studentNotes
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let lesson = lesson {
            return lesson.objectives.count
        } else {
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("objectiveCell", forIndexPath: indexPath) as! ObjectivesTableViewCell
        
        cell.delegate = self
        
        if let objective = lesson?.objectives[indexPath.row] {
            cell.objectiveLabel.text = objective.name
            cell.masterySwitch.on = objective.userHasMastered
        } else {
            cell.objectiveLabel.text = ""
            cell.masterySwitch.on = false
        }

        

        return cell
    }

    // MARK: - Objective Table View Cell Delegate
    
    func masterySwitchValueChangedOnCell(cell: ObjectivesTableViewCell) {
        if let indexPath = tableView.indexPathForCell(cell), let lesson = lesson {
            let objective = lesson.objectives[indexPath.row]
            
            objective.userHasMastered = cell.masterySwitch.on
        }
    }

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
