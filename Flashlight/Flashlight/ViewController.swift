//
//  ViewController.swift
//  Flashlight
//
//  Created by Caleb Hicks on 9/23/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    var isOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        
        if isOn {
            self.isOn = false
            
            self.button.setTitle("On", forState: .Normal)
            self.button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            self.view.backgroundColor = UIColor.blackColor()
            
        } else {
            self.isOn = true
            
            self.button.setTitle("Off", forState: .Normal)
            self.button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            self.view.backgroundColor = UIColor.whiteColor()
        }
    
    }

}

