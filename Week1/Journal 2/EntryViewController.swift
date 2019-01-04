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
    
    @IBAction func saveButtonTapped(_ sender: AnyObject) {
        if let entry = self.entry {
            titleTextField.text = entry.title
            bodyTextField.text = entry.bodyText
        } else {
            let newEntry = Entry(title: titleTextField.text!, bodyText: bodyTextField.text, timeStamp: Date())
            EntryController.sharedInstance.addEntry(newEntry)
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: AnyObject) {
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
    
    func updateWith(_ entry: Entry) {
        self.entry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextField.text = entry.bodyText
    }

}

extension EntryViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

