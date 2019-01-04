//
//  ViewController.swift
//  nameInput
//
//  Created by Kaleo Kim on 2/2/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "submitSegue" {
            let welcomeViewController = segue.destinationViewController as! ResultViewController
            
            welcomeViewController.emailString = emailTextField.text
        }
    }


}

