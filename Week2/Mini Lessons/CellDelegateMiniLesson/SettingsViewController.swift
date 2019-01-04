//
//  SettingsViewController.swift
//  CellDelegateMiniLesson
//
//  Created by Kaleo Kim on 2/12/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsController.sharedController.mySettings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("settingCell", forIndexPath: indexPath) as! SettingsTableViewCell
        
        let setting = SettingsController.sharedController.mySettings[indexPath.row]
        
        cell.updateCellWithSettings(setting)
        
        cell.delegate = self
        
        return cell
    }
    
}

extension SettingsViewController: SettingCellDelegate {
    func settingCellSwitchTapped(sender: SettingsTableViewCell) {
        // reload path with data
        
        if let indexPath = tableView.indexPathForCell(sender) {
            
            let setting = SettingsController.sharedController.mySettings[indexPath.row]
            
            setting.isSet = sender.settingsSwitch.on
            
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }
}




















