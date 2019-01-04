//
//  ViewController.swift
//  powernap
//
//  Created by Kaleo Kim on 4/12/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var startStopButton: UIButton!
    @IBOutlet var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNSNotificationObserver()
        setView()
        
    }
    
    func setView() {
        updateTimerLabel()
        
        if TimerController.sharedInstance.timer.isOn {
            startStopButton.setTitle("Stop", forState: .Normal)
        } else {
            startStopButton.setTitle("Start", forState: .Normal)
        }
    }

    func addNSNotificationObserver() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updateTimerLabel), name: "secondTick", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(presentTimerCompletedAlert), name: "timerCompleted", object: nil)
        
    }

    @IBAction func startButtonTapped(sender: AnyObject) {
        
        if TimerController.sharedInstance.timer.isOn {
            TimerController.sharedInstance.stopTimer()
        } else {
            TimerController.sharedInstance.startTimer()
        }
        setView()
        
    }
    
    func updateTimerLabel() {
        timerLabel.text = TimerController.sharedInstance.timeAsString()
    }
    
    func presentTimerCompletedAlert() {
        
        let alert = UIAlertController(title: "Times up!", message: "wake up!", preferredStyle: .Alert)
 
        let dismiss = UIAlertAction(title: "Dismiss", style: .Cancel) { (alert) in
            self.setView()
        }
        
        alert.addAction(dismiss)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
}

