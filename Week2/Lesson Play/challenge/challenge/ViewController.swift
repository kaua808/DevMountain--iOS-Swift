//
//  ViewController.swift
//  challenge
//
//  Created by Kaleo Kim on 2/10/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func notifyMe(sender: AnyObject) {
        
        let notification = UILocalNotification()
        
        notification.alertTitle = "By title"
        notification.alertBody = textField.text
        notification.fireDate = NSDate().dateByAddingTimeInterval(5)
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
}

