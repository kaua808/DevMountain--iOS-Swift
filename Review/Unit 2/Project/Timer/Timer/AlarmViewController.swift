//
//  AlarmViewController.swift
//  Timer
//
//  Created by Kaleo Kim on 4/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {
    @IBOutlet var labelOne: UILabel!
    @IBOutlet var startStopButton: UIButton!

    @IBOutlet var labelTwo: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    let alarm = Alarm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.minimumDate = NSDate()
        alarmNotOn()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(alarmNotOn), name: Alarm.notificationComplete, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alarmIsOn() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .LongStyle
        
        labelOne.text = "Alarm Set!"
        
        if let date = alarm.alarmDate {
            labelTwo.text = dateFormatter.stringFromDate(date)
            datePicker.date = date
        } else {
            labelTwo.text = ""
        }
        
        startStopButton.setTitle("Cancel Alarm", forState: .Normal)
        datePicker.userInteractionEnabled = false
    }
    
    func alarmNotOn() {
        alarm.cancel()
        datePicker.minimumDate = NSDate()
        datePicker.date = NSDate()
        datePicker.userInteractionEnabled = true
        
        labelOne.text = "Your alarm is not set."
        labelTwo.text = ""
        startStopButton.setTitle("Set Alarm", forState: .Normal)
        
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        if alarm.isArmed {
            alarm.cancel()
            alarmNotOn()
            
        } else {
            alarm.armed(datePicker.date)
            alarmIsOn()
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
