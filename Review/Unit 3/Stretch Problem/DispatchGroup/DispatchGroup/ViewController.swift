//
//  ViewController.swift
//  DispatchGroup
//
//  Created by Kaleo Kim on 4/22/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let group = dispatch_group_create()
//
//        dispatch_group_enter(group)
//        dispatch_async(dispatch_queue_create("queue1", nil)) {
//            self.getNewPhotos {
//                print("first done")
//                dispatch_group_leave(group)
//            }
//
//        }
//
//        dispatch_group_enter(group)
//        dispatch_async(dispatch_queue_create("queue2", nil)) {
//            self.uploadPhotos {
//                print("second done")
//                dispatch_group_leave(group)
//            }
//
//        }
//
//        dispatch_group_notify(group, dispatch_get_main_queue()) { () -> Void in
//            print("both all done")
//        }
        
        let group = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "queue1")
        let queue2 = DispatchQueue(label: "queue2")
        
        
        group.enter()
        queue1.async {
            
        }
        
        group.enter()
        queue2.async {
            print("im done second")
        }
        
        group.notify(queue: DispatchQueue.main) {
            print("both done")
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getNewPhotos(completion:() -> Void) {
        
        let randomNum1 = Double(arc4random_uniform(10))
        print(randomNum1)
        NSThread.sleepForTimeInterval(randomNum1)
        completion()
        
    }
    
    func uploadPhotos(completion: () -> Void) {
        
        let randomNum2 = Double(arc4random_uniform(10))
        print(randomNum2)
        NSThread.sleepForTimeInterval(randomNum2)
        completion()
        
    }


}

