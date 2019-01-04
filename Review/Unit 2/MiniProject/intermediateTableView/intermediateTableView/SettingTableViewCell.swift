//
//  SettingTableViewCell.swift
//  intermediateTableView
//
//  Created by Kaleo Kim on 4/13/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    var setting: Setting?

    weak var delegate: SettingTableViewCellDelegate?
    
    @IBOutlet var iconSettingView: UIImageView!
    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var settingSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateWithSetting(setting: Setting) {
        self.setting = setting
        
        iconSettingView.image = setting.image
        settingsLabel.text = setting.name
        settingSwitch.on = setting.isSet
        if setting.isSet {
            self.backgroundColor = .blueColor()
        } else {
            self.backgroundColor = .whiteColor()
        }
        
    }
    
    @IBAction func switchButtonTapped(sender: AnyObject) {
        delegate?.settingSwitchTapped(self, selected: settingSwitch.on)
    }

}

protocol SettingTableViewCellDelegate: class {
    
    func settingSwitchTapped(cell: SettingTableViewCell, selected: Bool)
    
}




