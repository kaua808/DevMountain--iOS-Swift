//
//  Teacher .swift
//  NotificationCenter
//
//  Created by Kaleo Kim on 2/9/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Teacher: NSObject {
    
    override init() {
        
        super.init()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "takeRoll", name: BellNotificationNames.kFirstBell, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "relax", name: BellNotificationNames.kLunchBell, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "recordGrades", name: BellNotificationNames.kLastBell, object: nil)
    }
    
    func takeRoll() {
        print("Take Roll")
    }
    
    func relax() {
        print("relax")
    }
    
    func recordGrades() {
        print("record grades")
    }
    
}