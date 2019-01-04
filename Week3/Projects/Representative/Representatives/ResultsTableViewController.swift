//
//  ResultsTableViewController.swift
//  Representatives
//
//  Created by Kaleo Kim on 2/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    var representatives: [Representative] = []
    
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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.representatives.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("representativeCell", forIndexPath: indexPath)

        let rep = self.representatives[indexPath.row]
        
        if let name = rep.name, party = rep.party {
            cell.textLabel?.text = name
            cell.detailTextLabel?.text = party
            
            if party == "I" {
                cell.detailTextLabel?.textColor = .yellowColor()
            } else if party == "D" {
                cell.detailTextLabel?.textColor = .blueColor()
            } else if party == "R" {
                cell.detailTextLabel?.textColor = .redColor()
            }
        }

        return cell
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "repTapped" {
            guard let cell = sender as? UITableViewCell else { return }
            
            let indexPath = self.tableView.indexPathForCell(cell)!
            let rep = self.representatives[indexPath.row]
            
            let detailViewController = segue.destinationViewController as! ResultsDetailTableViewController
            detailViewController.rep = rep
        }
    }


}
