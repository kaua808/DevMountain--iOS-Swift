//
//  ResultsTableViewController.swift
//  Representatives
//
//  Created by Taylor Mott on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    
    var repsArray: [Representative] = []
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "repTapped" {
            guard let cell = sender as? UITableViewCell else { return }
            
            let indexPath = self.tableView.indexPathForCell(cell)!
            let rep = self.repsArray[indexPath.row]
            
            let detailViewController = segue.destinationViewController as! RepresentativeDetailTableViewController
            detailViewController.rep = rep
        }
    }

    // MARK: - Table View Data Source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repsArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath)
        
        let rep = self.repsArray[indexPath.row]
        
        if let name = rep.name, party = rep.party {
            cell.textLabel?.text = name
            cell.detailTextLabel?.text = party
            if party == "I" {
                cell.detailTextLabel?.textColor = UIColor.yellowColor()
            } else if party == "D" {
                cell.detailTextLabel?.textColor = UIColor.blueColor()
            } else if party == "R" {
                cell.detailTextLabel?.textColor = UIColor.redColor()
            }
        }
        
        return cell
    }
}
