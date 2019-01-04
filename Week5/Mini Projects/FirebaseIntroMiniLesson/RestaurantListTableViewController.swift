//
//  RestaurantListTableViewController.swift
//  FirebaseIntroMiniLesson
//
//  Created by Jordan Nelson on 2/29/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import UIKit

class RestaurantListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        listenForNotifications()
        
    }
    
    func listenForNotifications() {
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "restaruantsUpdated:", name: RestaurantsUpdatedNotification, object: nil)
        

    }
    
    func restaruantsUpdated(notification: NSNotification) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
        })
    }

   
    @IBAction func addButtonTapped(sender: AnyObject) {
        setUpRestaurantAlert()
    }
    
    func setUpRestaurantAlert() {
        let alert = UIAlertController(title: "Add Restaurant", message: "Enter restaurant details below", preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        let save = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) { (action) -> Void in
            if let textFields = alert.textFields,
                let name = textFields[0].text,
                let address = textFields[1].text,
                let category = textFields[2].text {
                   
                    let restaurant = Restaurant(name: name, category: category, address: address)
                    RestaurantController.sharedController.addRestaurant(restaurant)
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(save)
        
        alert.addTextFieldWithConfigurationHandler { (nameField) -> Void in
            nameField.placeholder = "Name"
        }
        alert.addTextFieldWithConfigurationHandler { (addressField) -> Void in
            addressField.placeholder = "Address"
        }
        alert.addTextFieldWithConfigurationHandler { (categoryField) -> Void in
            categoryField.placeholder = "Category"
        }
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return RestaurantController.sharedController.restaurants.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantCell", forIndexPath: indexPath)

        let restaurant = RestaurantController.sharedController.restaurants[indexPath.row]
        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.address

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
