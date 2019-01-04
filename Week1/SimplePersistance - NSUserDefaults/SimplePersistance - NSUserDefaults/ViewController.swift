//
//  ViewController.swift
//  SimplePersistance - NSUserDefaults
//
//  Created by Kaleo Kim on 2/5/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // check NSUserDefaults for saved text
        
        let savedText = NSUserDefaults.standardUserDefaults().objectForKey("savedText")
        
        //if there is saved text se that to the textfield value
        
        if let text = savedText as? String {
            textField.text = text
        }
        
        
        
    }

    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        //capture text from textfield value
        
        let capturedText = textField.text

        //save text to NSUserDefaults
        
        NSUserDefaults.standardUserDefaults().setObject(capturedText, forKey: "savedText")
        

        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

