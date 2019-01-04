//
//  ViewController.swift
//  Grand Central Dispatch 2
//
//  Created by Kaleo Kim on 2/17/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func freezeButtonTapped(sender: AnyObject) {
        
        let myQueue = dispatch_queue_create("com.label.GCD", nil)
        
        dispatch_async(myQueue) { () -> Void in
            self.longRunningThing()
        }
        
        
    }
    
    func longRunningThing() {
        NSThread.sleepForTimeInterval(3)
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.numberLabel.text = String(arc4random_uniform(10000))
        }
    }


}

