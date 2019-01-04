//
//  AppearenceContoller.swift
//  UIAppearence play
//
//  Created by Kaleo Kim on 2/9/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation
import UIKit

class AppearanceController {
    
    static func initializeAppearanceDefault() {
        UINavigationBar.appearance().barTintColor = UIColor.sunsetRedColor()
        
        UIToolbar.appearance().barTintColor = UIColor.sunsetRedColor()
        
        UISegmentedControl.appearance().tintColor = UIColor.sunsetOrange()
    }
    

    
}