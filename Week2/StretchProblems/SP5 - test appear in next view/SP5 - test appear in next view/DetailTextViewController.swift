//
//  DetailTextViewController.swift
//  SP5 - test appear in next view
//
//  Created by Kaleo Kim on 2/9/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class DetailTextViewController: UIViewController {
    
    var text: String?

    @IBOutlet var labelOne: UILabel!
    @IBOutlet var labelTwo: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = text {
            labelOne.text = text
        }
        
        if let text = text {
            labelTwo.text = text
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWithText() {
        if let text = text {
            labelOne.text = text
        }
    }

}
