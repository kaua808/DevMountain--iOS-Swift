//
//  TimerViewController.swift
//  Timer
//
//  Created by Kaleo Kim on 4/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var hourPickerView: UIPickerView!
    @IBOutlet var hourLabel: UILabel!
    @IBOutlet var minutePickerView: UIPickerView!
    @IBOutlet var minuteLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    var timer = TimerController()
    
    @IBOutlet var pickTimeStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(TimerViewController.updateLabelAndProgress), name: TimerController.secondTicked, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(TimerViewController.setView), name: TimerController.timerComplete, object: nil)
        
        timerLabel.hidden = true
        progressView.hidden = true
        
    }

    func setView() {
        if timer.isOn {
            pickTimeStackView.hidden = true
            progressView.hidden = false
            timerLabel.hidden = false
        } else {
            pickTimeStackView.hidden = false
            progressView.hidden = false
            timerLabel.hidden = true
            updateTimerLabel()
            updateProgressView()
        }
    }
    
    @IBAction func startButtonTappes(sender: AnyObject) {
        let hours = hourPickerView.selectedRowInComponent(0)
        let minutes = minutePickerView.selectedRowInComponent(0) + (hours * 60)
        let totalSecondsSetOnTimer = NSTimeInterval(minutes * 60)
        
        timer.setTimer(totalSecondsSetOnTimer, totalSeconds: totalSecondsSetOnTimer)
        
        timer.startTimer()
        setView()
        
    }
    
    @IBAction func stopButtonTapped(sender: AnyObject) {
        
        timer.stopTimer()
        setView()
        
    }
    
    func updateLabelAndProgress() {
        updateTimerLabel()
        updateProgressView()
    }
    
    func updateTimerLabel() {
        
        timerLabel.text = timer.secondsRemaining
    }
    
    
    func updateProgressView() {
        
        let secondsElasped = timer.totalSeconds - timer.seconds
        
        let progress = Float(secondsElasped) / Float(timer.totalSeconds)
        
        progressView.setProgress(progress, animated: true)
    }
    
    
    //MARK: - UIPickerView Protocols
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView === hourPickerView {
            return 24
        } else if pickerView === minutePickerView {
            return 60
        } else {
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    
    
}
