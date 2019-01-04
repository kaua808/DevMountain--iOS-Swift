//
//  QueueTableViewController.swift
//  Queue
//
//  Created by Taylor Mott on 3/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CloudKit

class QueueTableViewController: UITableViewController {
    
    var records = [CKRecord]()

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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fetchCurrentQueue { (success) -> Void in
            print("\(success)")
            if success {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    @IBAction func subscribeButtonTapped() {
        
        let predicate = NSPredicate(format: "wasAnswered == 0")
        
        let subscription = CKSubscription(recordType: "Question", predicate: predicate, options: CKSubscriptionOptions.FiresOnRecordCreation)
        
        let notificationInfo = CKNotificationInfo()
        
        notificationInfo.shouldSendContentAvailable = true
        notificationInfo.desiredKeys = ["body", "studentName"]
        
        
        subscription.notificationInfo = notificationInfo
        
        CKContainer.defaultContainer().publicCloudDatabase.saveSubscription(subscription) { (subscription, error) -> Void in
            if let error = error {
                print("error saving subscription - \(error.localizedDescription)")
            } else {
                print(subscription)
            }
        }
        
        
    }
    
    func fetchCurrentQueue(completionHandler: (success: Bool) -> Void) {
        
        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        
        let predicate = NSPredicate(format: "wasAnswered == 0")
        
        let query = CKQuery(recordType: "Question", predicate: predicate)
        
        publicDatabase.performQuery(query, inZoneWithID: nil) { (recordsReturned, error) -> Void in
            if error == nil {
                guard let recordsReturned = recordsReturned else { completionHandler(success: false); return }
                
                let orderedRecords = recordsReturned.sort({
                
                    let date0 = $0.creationDate ?? NSDate()
                    let date1 = $1.creationDate ?? NSDate()
                    
                    return date0.timeIntervalSinceDate(date1) <= 0
                    
                })
                
                self.records = orderedRecords
                completionHandler(success: true)
                print(self.records)
                
            } else {
                //
                print("\(error?.localizedDescription)")
                completionHandler(success: false)
            }
        }
        
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return records.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("subtitleCell", forIndexPath: indexPath)

        let record = records[indexPath.row]
        
        cell.textLabel?.text = record["body"] as? String
        var detailText = record["studentName"] as? String ?? "(no name)"
        
        detailText = detailText + " - "
        
        if let creationDate = record.creationDate {
            let dateFormatter = NSDateFormatter()
            dateFormatter.timeStyle = .ShortStyle
            dateFormatter.dateStyle = .ShortStyle
            
            detailText = detailText + dateFormatter.stringFromDate(creationDate)
        }
        
        cell.detailTextLabel?.text = detailText
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
