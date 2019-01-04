//
//  RecieverViewController.swift
//  NotificationMiniProject
//
//  Created by Kaleo Kim on 4/11/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class RecieverViewController: UIViewController {

    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(notificationRecieved(_:)), name: "buttonTapped", object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func notificationRecieved(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
            text = userInfo["text"] as? String else {return}
            label.text = text
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
