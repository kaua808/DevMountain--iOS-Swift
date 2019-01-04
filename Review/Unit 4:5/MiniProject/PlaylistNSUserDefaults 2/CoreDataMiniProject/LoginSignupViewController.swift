//
//  LoginSignupViewController.swift
//  PlaylistNSUserDefaults
//
//  Created by Kaleo Kim on 5/2/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {
    
    @IBOutlet var userNameTextfield: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
    
        UserController.authUser(emailTextField.text ?? "", password: passwordTextField.text ?? "") { (user) in
            if let _ = user {
                self.performSegueWithIdentifier("toListView", sender: nil)
            } else {
                self.presentInvalidLoginAlert()
            }
        }
    }

    @IBAction func signupButtonTapped(sender: AnyObject) {
        
        UserController.createUser(userNameTextfield.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "") { (user) in
            if let _ = user {
                self.performSegueWithIdentifier("toListView", sender: nil)
            } else {
                self.presentInvalidCreationAlert()
            }
        }
        
    }
    
    func presentInvalidLoginAlert() {
        let alert = UIAlertController(title: "Invalid Login", message: "Please try logging in again", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Okay", style: .Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func presentInvalidCreationAlert() {
        let alert = UIAlertController(title: "Invalid User Creation", message: "Please try a different email, password, or username", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Okay", style: .Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
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
