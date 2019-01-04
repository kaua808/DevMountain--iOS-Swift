//
//  ViewController.swift
//  Apple View Controllers
//
//  Created by Kaleo Kim on 4/27/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, SFSafariViewControllerDelegate {
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func imageTapped(sender: AnyObject) {
        
        let impagePicker = UIImagePickerController()
        impagePicker.delegate = self
        let actionSheet = UIAlertController(title: "", message: nil, preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        let cameraAction = UIAlertAction(title: "Choose from Camera", style: .Default) { (_) in
            
            impagePicker.sourceType = .Camera
            self.presentViewController(impagePicker, animated: true, completion: nil)
            
        }
        
        let libraryAction = UIAlertAction(title: "Photo Library", style: .Default) { (_) in
            
            impagePicker.sourceType = .PhotoLibrary
            self.presentViewController(impagePicker, animated: true, completion: nil)
            
        }
        
        let savedAction = UIAlertAction(title: "Saved Photo", style: .Default) { (_) in
            
            impagePicker.sourceType = .SavedPhotosAlbum
            self.presentViewController(impagePicker, animated: true, completion: nil)
            
        }
        
        actionSheet.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            actionSheet.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            actionSheet.addAction(libraryAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum) {
            actionSheet.addAction(savedAction)
        }
        
        presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        imageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func emailButtonTapped(sender: AnyObject) {
        guard MFMailComposeViewController.canSendMail() else {return}
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["kauakim@gmail.com"])
        mailController.setSubject("WASSSSSSSSSSSUP")
        mailController.setMessageBody("check this out holmes", isHTML: false)
        if let image = imageView.image,
            imageData = UIImageJPEGRepresentation(image, 0.3) {
            mailController.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "test image")
        }
        presentViewController(mailController, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func shareButtonTapped(sender: AnyObject) {
        
        guard let image = imageView.image else {return}
        
            let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        presentViewController(activityController, animated: true, completion: nil)
        
    }
    
    @IBAction func imgaeBrowswerTapped(sender: AnyObject) {
        
        if let url = NSURL(string: "http://www.google.com") {
        
            let safariViewController = SFSafariViewController(URL: url)
            presentViewController(safariViewController, animated: true, completion: nil)
        }
        
    }
    
    
}

