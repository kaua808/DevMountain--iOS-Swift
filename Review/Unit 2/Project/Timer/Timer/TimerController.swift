//
//  TimerController.swift
//  Timer
//
//  Created by Kaleo Kim on 4/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class TimerController: NSObject {
    
    static let secondTicked = "secondTicked"
    static let timerComplete = "timerComplete"

    private(set) var seconds = NSTimeInterval(0)
    private(set) var totalSeconds = NSTimeInterval(0)
    private var timer: NSTimer?
    
    var isOn: Bool {
        if timer != nil {
            return true
        } else {
            return false
        }
    }
    
    var secondsRemaining: String {
        get {
            let totalSeconds = Int(self.seconds)
            
            let hours = totalSeconds / 3600
            let minutes = (totalSeconds - (hours * 3600)) / 60
            let seconds = totalSeconds - (hours * 3600) - (minutes * 60)
            
            var hoursString = ""
            if hours > 0 {
                hoursString = "\(hours):"
            }
            
            var minutesString = ""
            if minutes < 10 {
                minutesString = "0\(minutes):"
            } else {
                minutesString = "\(minutes):"
            }
            
            var secondsString = ""
            if seconds < 10 {
                secondsString = "0\(seconds)"
            } else {
                secondsString = "\(seconds)"
            }
            
            return hoursString + minutesString + secondsString
        }
    }
    
    func setTimer(seconds: NSTimeInterval, totalSeconds: NSTimeInterval) {
        self.seconds = seconds
        self.totalSeconds = totalSeconds
    }
    
    func startTimer() {
        
        if !isOn {
        
            timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1.0), target: self, selector: #selector(TimerController.secondTick), userInfo: nil, repeats: true)
        
        }
        
    }
    
    func stopTimer() {
        if isOn {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func secondTick() {

            seconds -= 1
            NSNotificationCenter.defaultCenter().postNotificationName(TimerController.secondTicked, object: nil)
        if seconds == 0 {
            
            self.stopTimer()
            NSNotificationCenter.defaultCenter().postNotificationName(TimerController.timerComplete, object: nil)
            
        }
        
    }
    
}