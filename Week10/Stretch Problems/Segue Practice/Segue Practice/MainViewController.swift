//
//  MainViewController.swift
//  Segue Practice
//
//  Created by Kaleo Kim on 4/11/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        //self.resignFirstResponder()
//    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "firstButton" {
            if let text = firstTextField.text {
                if let destinationViewController = segue.destinationViewController as? DetailViewController {
                    destinationViewController.textToUse = text
                }
                
            }
        } else if segue.identifier == "secondButton" {
//            if let text = secondTextField.text {
//                if let destinationViewController = segue.destinationViewController as? DetailViewController {
//                    destinationViewController.textToUse = text
//                }
            (segue.destinationViewController as? DetailViewController)?.textToUse = secondTextField.text
            }
        }
    
    
}
