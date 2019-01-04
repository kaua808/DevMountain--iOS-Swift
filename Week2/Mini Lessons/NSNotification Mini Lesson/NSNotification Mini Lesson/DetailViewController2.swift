//
//  DetailViewController2.swift
//  NSNotification Mini Lesson
//
//  Created by Kaleo Kim on 2/9/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class DetailViewController2: UIViewController {

    @IBOutlet var notificationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notificationReecieved", name: notificationKey, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeColor", name: colorNotificationKey, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func notificationReecieved() {
        notificationLabel.text = "I got the notification too!"
    }
    
    func changeColor() {
        notificationLabel.backgroundColor = .redColor()
    }

}
