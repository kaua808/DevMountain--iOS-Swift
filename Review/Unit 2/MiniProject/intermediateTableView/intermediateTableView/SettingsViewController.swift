//
//  SettingsViewController.swift
//  intermediateTableView
//
//  Created by Kaleo Kim on 4/13/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingTableViewCellDelegate {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SettingController.sharedController.mySettings.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("settingCell") as? SettingTableViewCell
            
        let setting = SettingController.sharedController.mySettings[indexPath.row]
        cell?.updateWithSetting(setting)
        cell?.delegate = self
        
        return cell ?? UITableViewCell()
        
        
        
    }
    
    func settingValueChanged(cell: SettingTableViewCell, selected: Bool) {
        guard let setting = cell.setting,
            cellIndexPath = tableView.indexPathForCell(cell) else {return}
        tableView.beginUpdates()
        SettingController.sharedController.updateSettingSelection(setting, selected: selected)
        tableView.reloadRowsAtIndexPaths([cellIndexPath], withRowAnimation: .Automatic)
        tableView.endUpdates()
    }
    
//    func settingSwitchTapped(cell: SettingTableViewCell, selected: Bool) {
//        guard let setting = cell.setting else {return}
//        
//        SettingController.sharedController.updateSettingSelection(setting, selected: selected)
//        tableView.reloadData()
//    }
    

}
