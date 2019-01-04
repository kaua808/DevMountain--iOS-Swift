//
//  ObjectivesTableViewCell.swift
//  CourseTracker
//
//  Created by Kaleo Kim on 2/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

protocol ObjectiveTableViewCellDelegate: class {
    func masterySwitchValueChangedOnCell(cell: ObjectivesTableViewCell)
}

class ObjectivesTableViewCell: UITableViewCell {

    @IBOutlet var objectiveLabel: UILabel!
    @IBOutlet var masterySwitch: UISwitch!
    
    weak var delegate: ObjectiveTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func masterySwitchValueChanged(sender: UISwitch) {
        delegate?.masterySwitchValueChangedOnCell(self)
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
