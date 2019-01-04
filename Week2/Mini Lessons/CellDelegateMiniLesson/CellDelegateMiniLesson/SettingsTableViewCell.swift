//
//  settingsTableViewCell.swift
//  CellDelegateMiniLesson
//
//  Created by Kaleo Kim on 2/12/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    weak var delegate: SettingCellDelegate?

    @IBOutlet var settingsImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var settingsSwitch: UISwitch!
    
    //var settings: Setting?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchTapped(sender: AnyObject) {
        delegate?.settingCellSwitchTapped(self)
    }
    
}

protocol SettingCellDelegate: class {
    func settingCellSwitchTapped(sender: SettingsTableViewCell)
}

extension SettingsTableViewCell {
    
    // updating cells UI according to the settings
    func updateCellWithSettings(setting: Setting) {
        if let image = setting.image {
            settingsImage.image = image
        }
        
        nameLabel.text = setting.name
        settingsSwitch.on = setting.isSet
        
        if setting.isSet {
            self.backgroundColor = .whiteColor()
        } else {
            self.backgroundColor = .lightGrayColor()
        }
    }
    
}

