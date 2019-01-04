//
//  FirstViewController.swift
//  Apple View Controllers (image picker, mail, action, etc)
//
//  Created by Kaleo Kim on 2/25/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit
import MessageUI

class FirstViewController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var favoriteSongTextField: UITextField!
    
    @IBAction func shareButtonTapped(sender: AnyObject) {
        
//        if MFMailComposeViewController.canSendMail() {
//            
//        }
        
        let shareViewController = MFMailComposeViewController()
        
        shareViewController.setCcRecipients(["kauakim@gmail.com"])
        shareViewController.setSubject("This is my favorite song!")
        
        if let song = favoriteSongTextField.text {
            shareViewController.setMessageBody("\(song) is my favorite song!", isHTML: false)
        }
        
        shareViewController.mailComposeDelegate = self
        
        
        
        presentViewController(shareViewController, animated: true, completion: nil)
        
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

