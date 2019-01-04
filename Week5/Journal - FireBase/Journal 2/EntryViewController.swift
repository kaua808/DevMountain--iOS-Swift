//
//  EntryViewController.swift
//  Journal 2
//
//  Created by Kaleo Kim on 2/6/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    var entry: Entry?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let entry = self.entry {
            titleTextField.text = entry.title
            bodyTextField.text = entry.text
        } else {
            let newEntry = Entry(title: titleTextField.text!, text: bodyTextField.text, timeStamp: NSDate())
            EntryController.sharedInstance.addEntry(newEntry)
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        self.titleTextField.text = ""
        self.bodyTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entry = entry {
            updateWith(entry)
        }

        // Do any additional setup after loading the view.
    }
    
    func updateWith(entry: Entry) {
        self.entry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextField.text = entry.text
    }

}

extension EntryViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

