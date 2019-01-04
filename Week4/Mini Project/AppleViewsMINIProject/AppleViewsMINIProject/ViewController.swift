//
//  ViewController.swift
//  AppleViewsMINIProject
//
//  Created by Kaleo Kim on 2/25/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraButtonTapped(sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        let alert = UIAlertController(title: "Select Photo Option", message: nil, preferredStyle: .ActionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            alert.addAction(UIAlertAction(title: "Camera Roll", style: .Default, handler: { _ in
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
        
    }

    @IBAction func mailButtonTapped(sender: AnyObject) {
        
        if(MFMailComposeViewController.canSendMail()) {
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            
            mailComposer.setSubject("Hey Kaleo")
            mailComposer.setMessageBody("Is the Mic on?", isHTML: false)
            
            self.presentViewController(mailComposer, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func activityButtonTapped(sender: AnyObject) {
        
        let activity = UIActivityViewController(activityItems: [UIActivityTypeMail], applicationActivities: [])
        
        self.presentViewController(activity, animated: true, completion: nil)
        
    }
    
    @IBAction func webButtonTapped(sender: AnyObject) {
    
        let svc = SFSafariViewController(URL: NSURL(string: "http://www.google.com")!)
        
        presentViewController(svc, animated: true, completion: nil)
    
    }
    
    
}


















