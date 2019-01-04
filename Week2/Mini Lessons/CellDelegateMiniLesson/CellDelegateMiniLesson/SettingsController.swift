//
//  SettingsController.swift
//  CellDelegateMiniLesson
//
//  Created by Jordan Nelson on 2/12/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import UIKit

class SettingsController {
    
    static let sharedController = SettingsController()
    
    var mySettings = [Setting]()
    
    init() {
        let music = Setting(name: "Music", isSet: false, image: UIImage(named: "music"))
        let apps = Setting(name: "Apps", isSet: true, image: UIImage(named: "apps"))
        let books = Setting(name: "Books", isSet: false, image:UIImage(named: "books"))
        let updates = Setting(name: "Updates", isSet: false, image: UIImage(named: "apps"))
        
        mySettings = [music, apps, books, updates]
    }
    
}