//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Kaleo Kim on 2/9/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let student = Student()
        let teacher = Teacher()
        
        NSNotificationCenter.defaultCenter().postNotificationName(BellNotificationNames.kFirstBell, object:self)
        
        NSNotificationCenter.defaultCenter().postNotificationName(BellNotificationNames.kLunchBell, object: self)
        
        NSNotificationCenter.defaultCenter().postNotificationName(BellNotificationNames.kLastBell, object: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

