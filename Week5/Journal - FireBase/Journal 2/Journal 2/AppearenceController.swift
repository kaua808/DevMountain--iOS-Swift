//
//  Appearence.swift
//  Journal 2
//
//  Created by Kaleo Kim on 2/9/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation
import UIKit

class AppearanceController {
    
    static func initializeDefaultColor() {
        
        UINavigationBar.appearance().barTintColor = UIColor.darkGray()
        
        UIButton.appearance().tintColor = UIColor.darkGray()
        
        //UIView.appearance().backgroundColor = UIColor.lightGray()
        
        UITextField.appearance().backgroundColor = UIColor.lightGray()
        UITextField.appearance().textColor = UIColor.cyan()
        
        UITextView.appearance().backgroundColor = UIColor.lightGray()
        UITextView.appearance().textColor = UIColor.cyan()
        
        UITableViewCell.appearance().backgroundColor = UIColor.cyan()
        
        
        
    }
}