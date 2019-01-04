//
//  ViewController.swift
//  Alert play
//
//  Created by Kaleo Kim on 2/10/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let alertController = UIAlertController(title: "Alert!", message: "This is dumb Parker", preferredStyle: .Alert)
        
        let destructiveAction = UIAlertAction(title: "Warning", style: .Destructive) { alert -> Void in
            print("Something blew up.")
        }
        
        let defaultAction = UIAlertAction(title: "cancel", style: .Cancel) { alert -> Void in
            print("Boring.")
        }
        
        let okayAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in
            print("okey okey")
        }
        alertController.addAction(okayAction)
        alertController.addAction(destructiveAction)
        alertController.addAction(defaultAction)

        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

