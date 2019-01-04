//
//  DetailViewController1.swift
//  NSNotification Mini Lesson
//
//  Created by Kaleo Kim on 2/9/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class DetailViewController1: UIViewController {

    @IBOutlet var notificationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notificationRecieved", name: notificationKey, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeColor", name: colorNotificationKey, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func notificationRecieved() {
        notificationLabel.text = "We got the Notification"
    }
    
    func changeColor() {
        view.backgroundColor = .lightGrayColor()
    }

}
