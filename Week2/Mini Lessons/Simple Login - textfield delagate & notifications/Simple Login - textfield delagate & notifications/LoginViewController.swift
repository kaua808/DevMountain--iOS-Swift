//
//  LoginViewController.swift
//  Simple Login - textfield delagate & notifications
//
//  Created by Kaleo Kim on 2/10/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func forgotPasswordTapped(sender: AnyObject) {
        let alert = UIAlertController(title: "Forgot", message: "Enter Email to reset", preferredStyle: .Alert)
        
        // add action
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alert.addAction(cancel)
        
        
        let reset = UIAlertAction(title: "Reset", style: .Default) { (action) -> Void in
            if let textFields = alert.textFields {
                if textFields[0].hasText() {
                    if let forgottenEmail = textFields[0].text {
                        self.createAlert("Check your email ~ \(forgottenEmail) for password reset!", success: true)
                    }
                } else {
                    self.createAlert("Invalid email", success: false)
                }
            }
        }
        alert.addAction(reset)
        
        
        alert.addTextFieldWithConfigurationHandler { (emailfield) -> Void in
            self.emailField.placeholder = "emailexample@gmail.com"
        }
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    @IBAction func signInTapped(sender: AnyObject) {
        
        // check textfield for empty case -> bool
        if checkTextField() == true {
            //sign in
            
            createAlert("Signed In \(emailField.text)", success: true)
        } else {
            // present error
            
        }
        
        // present error || sign them in
    }
    
    func checkTextField() -> Bool {
        if emailField.text?.isEmpty == true || passwordField.text?.isEmpty == true {
            createAlert("Must enter required fields to sign in/", success: false)
            return false
        } else {
            if emailField.text?.containsString("@") == false {
                createAlert("Enter valid email address", success: false)
                return false
            } else {
                createAlert("sign in \(emailField.text)", success: true)
            return true
            }
        }
    }
    
    func createAlert(alertMessage: String, success: Bool) {
        var titleString = ""
        if success == true {
            titleString = "SUCCESS"
        } else {
            titleString = "ERROR"
        }
        
        let alertController = UIAlertController(title: titleString, message: alertMessage, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // check for valid email ~ @
        
        if textField == emailField && textField.text?.containsString("@") == false {
            textField.textColor = .redColor()
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.textColor = UIColor.blackColor()
    }
    
}
