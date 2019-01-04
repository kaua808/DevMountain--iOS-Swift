//
//  ViewController.swift
//  NSNotification Mini Lesson
//
//  Created by Kaleo Kim on 2/9/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

let notificationKey = "notifyKey"
let colorNotificationKey = "colorKey"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func notifyButtonPressed(sender: AnyObject) {
        
        NSNotificationCenter.defaultCenter().postNotificationName(notificationKey, object: self)
        
    }

    @IBAction func changeColorButton(sender: AnyObject) {
        
        NSNotificationCenter.defaultCenter().postNotificationName(colorNotificationKey, object: self)
        
    }
}

