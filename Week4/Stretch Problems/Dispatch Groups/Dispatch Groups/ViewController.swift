//
//  ViewController.swift
//  Dispatch Groups
//
//  Created by Kaleo Kim on 2/26/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let group = dispatch_group_create()
        
        dispatch_group_enter(group)
        dispatch_async(dispatch_queue_create("queue1", nil)) { () -> Void in
            self.getNewPhotos({ () -> Void in
                print("Get done")
                dispatch_group_leave(group)
            })
        }
        
        dispatch_group_enter(group)
        dispatch_async(dispatch_queue_create("queue2", nil)) { () -> Void in
            self.getNewPhotos({ () -> Void in
                print("Get done")
                dispatch_group_leave(group)
            })
        }
        
        dispatch_group_notify(group, dispatch_get_main_queue()) { () -> Void in
            print("both all done")
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getNewPhotos(completion: () -> Void) {
        let randomNum = Double(arc4random_uniform(11))
        print(randomNum)
        NSThread.sleepForTimeInterval(randomNum)
        completion()
    }
    
    func uploadPhotos(completion:() -> Void) {
        let randomNum = Double(arc4random_uniform(11))
        print(randomNum)
        NSThread.sleepForTimeInterval(randomNum)
        completion()
    }
    
}









