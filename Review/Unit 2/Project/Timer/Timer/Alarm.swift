//
//  AlarmViewController.swift
//  Timer
//
//  Created by Kaleo Kim on 4/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class Alarm: NSObject {
    
    static let categoryAlarm = "categoryAlarm"
    static let notificationComplete = "notificationComplete"
    
    private(set) var alarmDate: NSDate?
    private var localNotification: UILocalNotification?
    
    var isArmed: Bool {
        
            if alarmDate != nil {
                return true
            } else {
                return false
            }
        
    }
    
    func armed(fireDate: NSDate) {
        
        alarmDate = fireDate
        
        localNotification = UILocalNotification()
        localNotification?.alertBody = "Wake up!"
        localNotification?.alertTitle = "Time's up!"
        localNotification?.fireDate = alarmDate
        localNotification?.category = Alarm.categoryAlarm
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification ?? UILocalNotification())
        
    }
    
    func cancel() {
        
        if isArmed {
            alarmDate = nil
            if let localNotification = localNotification {
                UIApplication.sharedApplication().cancelLocalNotification(localNotification)
            }
        }
    }
   
    static func alarmComplete() {
        NSNotificationCenter.defaultCenter().postNotificationName(notificationComplete, object: nil)
    }
    
}