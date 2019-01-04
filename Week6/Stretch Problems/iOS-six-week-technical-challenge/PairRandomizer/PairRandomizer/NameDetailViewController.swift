//
//  NameDetailViewController.swift
//  PairRandomizer
//
//  Created by Kaleo Kim on 3/14/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class NameDetailViewController: UIViewController {
    
    var person: Person?

    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = person {
            updateWith(person)
        }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func doneButtonTapped(sender: AnyObject) {
        
        if let person = self.person {
            person.name = nameTextField.text!
        }
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func updateWith(person: Person) {
        self.person = person
        
        self.nameTextField.text = person.name
    }

}