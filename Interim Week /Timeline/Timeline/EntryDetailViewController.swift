//
//  EntryDetailViewController.swift
//  Timeline
//
//  Created by Kaleo Kim on 3/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: Entry?

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        if let entry = self.entry {
            titleTextField.text = entry.title
            bodyTextView.text = entry.body
        } else {
            let newEntry = Entry(title: titleTextField.text!, body: bodyTextView.text)
            EntryController.sharedInstance.addEntry(newEntry)
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

    @IBAction func clearButtonTapped(sender: AnyObject) {
        
        titleTextField.text = ""
        bodyTextView.text = ""
        
    }
    
    func updateWith(entry: Entry) {
        
        self.entry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.body
        
    }
    
}
