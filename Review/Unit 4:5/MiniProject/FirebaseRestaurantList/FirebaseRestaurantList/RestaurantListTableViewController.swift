//
//  RestaurantListTableViewController.swift
//  FirebaseRestaurantList
//
//  Created by Kaleo Kim on 4/28/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class RestaurantListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updateUI), name: "restaurantUpadte", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RestaurantController.sharedInstance.restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantCell", forIndexPath: indexPath)

        let restaurant = RestaurantController.sharedInstance.restaurants[indexPath.row]
        
        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.category

        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let restaurant = RestaurantController.sharedInstance.restaurants[indexPath.row]
            RestaurantController.sharedInstance.deleteRestaurant(restaurant)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
 


    @IBAction func addRestaurantTapped(sender: AnyObject) {
        
        var nameTextField: UITextField? = nil
        var categoryTextField: UITextField? = nil
        let alert = UIAlertController(title: "Add Restaurant", message: nil, preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Name"
            nameTextField = textField
        }
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Category"
            categoryTextField = textField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add Restaurant", style: .Default) { (_) in
            guard let name = nameTextField?.text,
                category = categoryTextField?.text where name.characters.count > 0 else {return}
            RestaurantController.sharedInstance.addRestaurant(name, category: category)
            self.tableView.reloadData()
        }
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        presentViewController(alert, animated: true, completion: nil)
    }

}















