//
//  ViewController.swift
//  local notif
//
//  Created by Kaleo Kim on 2/10/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "localNotificationFired", name: "Notification", object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func notifyMe(sender: AnyObject) {
        
        let notif = UILocalNotification()
        
        notif.alertBody = "Body: You've been notified"
        notif.alertTitle = "Title: I'm the title"
        notif.fireDate = NSDate().dateByAddingTimeInterval(5)
        
        UIApplication.sharedApplication().scheduleLocalNotification(notif)
        
    }
    
    func localNotificationFired() {
        
        let alertController = UIAlertController(title: "Whoa", message: "A notification", preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        let action1 = UIAlertAction(title: "OK", style: .Default, handler: nil)
        let action2 = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alertController.addAction(action)
        alertController.addAction(action1)
        alertController.addAction(action2)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    

}

