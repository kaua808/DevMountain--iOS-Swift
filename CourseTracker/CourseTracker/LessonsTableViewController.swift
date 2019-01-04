//
//  LessonsTableViewController.swift
//  CourseTracker
//
//  Created by Kaleo Kim on 2/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LessonsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Week \(section + 1)"
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
//        let countDouble = Double(LessonController.sharedController.lessons.count)
//        let numberDaysInWeek = 5.0
//        
//        let ceiling = ceil(countDouble / numberDaysInWeek)
//        
//        let numberOfSection = Int(ceiling)
//        
//        return numberOfSection
        
        return Int(ceil(Double(LessonController.sharedController.lessons.count) / 5.0))
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if LessonController.sharedController.lessons.count / 5 == section {
            return LessonController.sharedController.lessons.count % 5
        } else {
            return 5
        }
        
//        return LessonController.sharedController.lessons.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("lessonCell", forIndexPath: indexPath) as! LessonTableViewCell
        
        let index = indexPath.section * 5 + indexPath.row
        
        let lesson = LessonController.sharedController.lessons[index]
        
        var dateString = "Week \(indexPath.section + 1)\n"
        
        switch indexPath.row {
        case 0:
            dateString = dateString + "Mon"
        case 1:
            dateString = dateString + "Tues"
        case 2:
            dateString = dateString + "Wed"
        case 3:
            dateString = dateString + "Thurs"
        case 4:
            dateString = dateString + "Fri"
        default:
            break
        }
        
        cell.dateLabel.text = dateString
        cell.nameLabel.text = lesson.name
        
        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toLessonDetail" {
            let lessonDetailTableViewController = segue.destinationViewController as! LessonDetailTableViewController
            
        
            
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(cell) {
                let index = indexPath.section * 5 + indexPath.row
                let lessonToPass = LessonController.sharedController.lessons[index]
                lessonDetailTableViewController.lesson = lessonToPass
            }
            

        }

    }


}
