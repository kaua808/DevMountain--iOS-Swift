//
//  ViewController.swift
//  GCD Stretch
//
//  Created by Kaleo Kim on 4/18/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func freezeTapped(sender: AnyObject) {
        
        // you could just call longrun as well will work and comment the rest in this button
        //longRun()
        
        
        let myQueue = dispatch_queue_create("doesntMatter", nil)
        
        dispatch_async(myQueue) { () -> Void in
            self.longRunningFunc()
        }
    }
    
    func longRunningFunc() {
        
        NSThread.sleepForTimeInterval(6)
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.label.text = String(arc4random_uniform(10000))
        }
    }
    
    func longRun() {
        
        let myQueue = dispatch_queue_create("doesntMatter", nil)
        
        dispatch_async(myQueue) { () -> Void in
            
            NSThread.sleepForTimeInterval(6)
            
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.label.text = String(arc4random_uniform(10000))
            }
            
        }
    }

}





