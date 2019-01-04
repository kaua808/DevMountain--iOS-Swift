//
//  ViewController.swift
//  authMiniProject
//
//  Created by Kaleo Kim on 3/1/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    // this would normally live in another file in a shared instance
    let base = Firebase(url: "fierytimeline.firebaseIO.com")

    @IBOutlet var signupEmailTextField: UITextField!
    @IBOutlet var signupPasswordTextField: UITextField!
    @IBOutlet var singupLabel: UILabel!
    @IBOutlet var loginEmailTextField: UITextField!
    @IBOutlet var loginPasswordTextField: UITextField!
    @IBOutlet var logingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signupButtonTapped(sender: AnyObject) {
        
        if let email = signupEmailTextField.text, password = signupPasswordTextField.text where email.characters.contains("@") && password.characters.count > 5 {
            
            base.createUser(email, password: password, withValueCompletionBlock: { (error, results) -> Void in
                if let error = error {
                    print("couldnt signup due to error \(error.localizedDescription)")
                } else {
                    if let uid = results["uid"] {
                        self.singupLabel.text = "Accout \(uid) successfully created"
                    }
                }
            })
            
        }
     
    }

    @IBAction func loginButtonTapped(sender: AnyObject) {

        if let email = loginEmailTextField.text, password = loginPasswordTextField.text where email.characters.contains("@") && password.characters.count > 5 {
            
            base.authUser(email, password: password, withCompletionBlock: { (error, authData) -> Void in
                
                if let error = error {
                    print("could not create account due to error \(error.localizedDescription)")
                } else {
                    self.logingLabel.text =
                }
                
            })
            
            
        }
        
    }



}

































////CREATE

//        if let email = signupEmailTextField.text,
//            password = signupPasswordTextField.text where email.characters.contains("@") && password.characters.count > 5 {
//
//                base.createUser(email, password: password, withValueCompletionBlock: { (error, result) -> Void in
//                    if let error = error {
//                        print("cound not create user due to error \(error.localizedDescription)")
//                    } else {
//                        if let uid = result["uid"] {
//                            self.singupLabel.text = "Account \(uid) successfully created"
//                        }
//                    }
//                })
//        }

// LOGIN

//        if let email = loginEmailTextField.text,
//            password = loginPasswordTextField.text where email.characters.contains("@") && password.characters.count > 5 {
//
//                base.authUser(email, password: password, withCompletionBlock: { (error, authData) -> Void in
//
//                    if let error = error {
//                        print("could not log in user due to error \(error.localizedDescription)")
//                    } else {
//                        self.logingLabel.text = "Acount \(authData.uid) has been successfully logged in"
//                    }
//
//
//                })
//
//        }

