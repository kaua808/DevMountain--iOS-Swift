//
//  SettingController.swift
//  intermediateTableView
//
//  Created by Kaleo Kim on 4/13/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class SettingController {
    
    static let sharedController = SettingController()
    
    var mySettings: [Setting]
    
    init() {
        let music = Setting(image: UIImage(named: "music"), name: "Music", isSet: false)
        let apps = Setting(image: UIImage(named: "apps"), name: "Apps", isSet: true)
        let books = Setting(image: UIImage(named: "books"), name: "Books", isSet: true)
        let updates = Setting(image: UIImage(named: "apps"), name: "Updates", isSet: false)
        
        self.mySettings = [music, apps, books, updates]
    }
    
    func updateSettingSelection(setting: Setting, selected: Bool) {
        setting.isSet = selected
    }
    
}