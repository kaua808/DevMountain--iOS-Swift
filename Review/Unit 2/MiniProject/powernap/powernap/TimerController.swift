//
//  TimerController.swift
//  powernap
//
//  Created by Kaleo Kim on 4/12/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class TimerController: NSObject {
    
    
    static let sharedInstance = TimerController()
    
    var timer = Timer()
    var localNotification: UILocalNotification?
    
    func startTimer() {
        // check if timer is on. if not, then set the time to 20 min to start countdown
        
        if timer.isOn == false {
            timer.endDate = NSDate(timeIntervalSinceNow: 0.25*60)
            secondsTick()
            scheduleNotification()
        }
    }
    
    func stopTimer() {
        // check id it is on, then remove timers end date and stop countdown
        if timer.isOn {
            timer.endDate = nil
            performSelector(#selector(cancelNotification), withObject: nil, afterDelay: 0.5)
        }
    }
    
    func secondsTick() {
        // check to see if timeremaing > 0, if so, send notification to UI to updatelabel. otherwise stoptimer
        if timer.timeRemaining > 0 {
            performSelector(#selector(TimerController.secondsTick), withObject: nil, afterDelay: 1)
            NSNotificationCenter.defaultCenter().postNotificationName("secondTick", object: nil)
        } else {
            NSNotificationCenter.defaultCenter().postNotificationName("timerCompleted", object: nil)
            stopTimer()
        }
    }
    
    func scheduleNotification() {
        //ceatre local notification eith same firedate as the timer
        localNotification = UILocalNotification()
        localNotification?.alertBody = "its time to wake up"
        localNotification?.alertTitle = "Times up"
        localNotification?.fireDate = timer.endDate
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification ?? UILocalNotification())
        
    }
    
    func cancelNotification() {
        //cancel the local notification if the timer has been stopped
        UIApplication.sharedApplication().cancelLocalNotification(localNotification ?? UILocalNotification())
        
    }
    func timeAsString() -> String {
        // reutrn a string representing time remaing
        
        let timeRemaining = Int(timer.timeRemaining)
        let minutesLeft = timeRemaining / 60
        let secondsLeft = timeRemaining - (minutesLeft * 60)
        return String(format: "%02d : %02d", arguments: [minutesLeft, secondsLeft])
        
        
    }
    
    
}