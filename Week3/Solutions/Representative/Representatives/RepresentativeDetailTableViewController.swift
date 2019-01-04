//
//  RepresentativeDetailTableViewController.swift
//  Representatives
//
//  Created by Taylor Mott on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class RepresentativeDetailTableViewController: UITableViewController {

    var rep: Representative?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let rep = rep {
            title = rep.name
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let rep = rep else {
            return tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
        }
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
            cell.textLabel?.text = rep.name
            if let state = rep.state {
                cell.imageView?.image = UIImage(named: state)
            }
            var stateDistrictString = ""
            if let state = rep.state {
                stateDistrictString = state + " - "
            }
            
            if let district = rep.district {
                stateDistrictString = stateDistrictString + district
            }
            
            cell.detailTextLabel?.text = stateDistrictString
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Party"
            cell.detailTextLabel?.text = rep.party
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Website"
            cell.detailTextLabel?.text = rep.link
            return cell
        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Phone"
            cell.detailTextLabel?.text = rep.phone
            return cell
        case 4:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Office"
            cell.detailTextLabel?.text = rep.office
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        default:
            return 50
        }
    }

}
