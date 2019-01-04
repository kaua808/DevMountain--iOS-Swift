//
//  EntryDetailViewController.swift
//  Journal3
//
//  Created by Kaleo Kim on 2/7/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: Entry?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        if let entry = self.entry {
            titleTextField.text = entry.title
            bodyTextField.text = entry.bodyText
        } else {
            let newEntry = Entry(title: titleTextField.text!, bodyText: bodyTextField.text, timeStamp: NSDate())
            
            EntryController.sharedInstance.addEntry(newEntry)
        }
        
    }
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
