//
//  Student.swift
//  NotificationCenter
//
//  Created by Kaleo Kim on 2/9/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Student {
    
    init() {
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "goToClass", name: BellNotificationNames.kFirstBell, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "goEatLunch", name: BellNotificationNames.kLunchBell, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "getOnBus", name: BellNotificationNames.kLastBell, object: nil)
    }
    
    @objc func goToClass() {
        print("time to learn")
    }
    
    @objc func goEatLunch() {
        print("Eat lunch")
    }
    
    @objc func getOnBus() {
        print("Iam on the bus! vromm")
    }
}
