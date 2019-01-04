//
//  ViewController.swift
//  SP5 - test appear in next view
//
//  Created by Kaleo Kim on 2/9/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFieldOne: UITextField!
    @IBOutlet var textFieldTwo: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toFirstVc" {
            if let detailViewController = segue.destinationViewController as? DetailTextViewController {
                detailViewController.text = textFieldOne.text
            }
        } else if segue.identifier == "toSecondVc"{
            if let detailViewController = segue.destinationViewController as? DetailTextViewController {
                detailViewController.text = textFieldTwo.text
            }
        }
    }
}

