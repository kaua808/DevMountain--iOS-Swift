//
//  Objective.swift
//  CourseTracker
//
//  Created by Taylor Mott on 2/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Objective {
    
    var id = ""
    var name = ""
    var userHasMastered = false
    
    func updateWithDictionary(dictionary: [String : AnyObject]) {

        name = dictionary["studentCan"] as? String ?? ""
        
        if let newIDFloat = dictionary["objectiveID"] as? Float {
            let numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = .DecimalStyle
            numberFormatter.roundingMode = .RoundHalfUp
            numberFormatter.maximumFractionDigits = 1
            numberFormatter.minimumFractionDigits = 1
            
            id = numberFormatter.stringFromNumber(NSNumber(float: newIDFloat)) ?? ""
        }
    }
    
}