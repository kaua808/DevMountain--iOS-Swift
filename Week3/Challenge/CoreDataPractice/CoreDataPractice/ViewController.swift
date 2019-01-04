//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Kaleo Kim on 2/15/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let request = NSFetchRequest(entityName: "Person")
        let moc = Stack.sharedStack.managedObjectContext
        if let people = try? moc.executeFetchRequest(request),
            person = people.first {
                let name = person.valueForKey("name") as! String
                nameTextField.text = name
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        let moc = Stack.sharedStack.managedObjectContext
        
        // NSentitydescription
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: moc)!
        
        // create person
        let newPerson = NSManagedObject(entity: entity, insertIntoManagedObjectContext: moc)
        newPerson.setValue(nameTextField.text, forKey: "name")
        
        //save
        let _ = try? moc.save()
    }


}

