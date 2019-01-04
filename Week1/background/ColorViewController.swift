//
//  ColorViewController.swift
//  background
//
//  Created by Kaleo Kim on 2/1/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBAction func colorButton(sender: AnyObject) {
        self.view.backgroundColor = .blackColor()
    }
    @IBAction func dragOut(sender: AnyObject) {
        self.view.backgroundColor = .whiteColor()
    }
    @IBAction func touchDown(sender: AnyObject) {
        self.view.backgroundColor = .yellowColor()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view did load")
        
        self.view.backgroundColor = .cyanColor()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        print("view will appreared")
    }
    
    override func viewDidAppear(animated: Bool) {
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("view will dissapear")
    }
}
