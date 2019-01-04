//
//  Setting.swift
//  intermediateTableView
//
//  Created by Kaleo Kim on 4/13/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation
import UIKit

class Setting {
    
    let image: UIImage?
    let name: String
    var isSet: Bool
    
    init(image: UIImage?, name: String, isSet: Bool) {
        self.image = image
        self.name = name
        self.isSet = isSet
    }
}