//
//  ResultViewController.swift
//  nameInput
//
//  Created by Kaleo Kim on 2/2/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var welcomLabel: UILabel!
    
    var emailString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emailString = emailString {
            welcomLabel.text = "Welcome \(emailString)"
        } else {
            welcomLabel.text = "Welcome"
        }

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
