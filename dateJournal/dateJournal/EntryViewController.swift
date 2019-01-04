//
//  EntryViewController.swift
//  dateJournal
//
//  Created by Kaleo Kim on 3/11/17.
//  Copyright © 2017 Kaleo Kim. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    var entry: Entry?
    
    @IBOutlet weak var entryBodyText: UITextView!
    @IBOutlet weak var entryTitle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let entry = entry {
            updateWithEntry(entry)
        }
        // Do any additional setup after loading the view.
    }

    func updateWithEntry(_ entry: Entry) {
        
        self.entryTitle.text = entry.title
        self.entryBodyText.text = entry.bodyText
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        if let entry = self.entry {
            entryTitle.text = entry.title
            entryBodyText.text = entry.bodyText
        } else {
            let newEntry = Entry(title: entryTitle.text!, bodyText: entryBodyText.text)
            EntryController.shared.addEntry(newEntry)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
