//
//  SenderViewController.swift
//  NotificationMiniProject
//
//  Created by Kaleo Kim on 4/11/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class SenderViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonTapped(sender: AnyObject) {
        guard let text = textField.text else {return}
    NSNotificationCenter.defaultCenter().postNotificationName("buttonTapped", object: nil, userInfo: ["text": text])
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
