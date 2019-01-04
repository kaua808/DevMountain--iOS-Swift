//
//  ViewController.swift
//  firebaseminiproject
//
//  Created by Kaleo Kim on 2/29/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let dataRef = FireBaseController.entryBase
        dataRef.observeEventType(.Value, withBlock: { (snap) -> Void in
            guard let text = snap.value as? String else { return }
            self.textField.text = text
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//    func loadEntries() {
//        let entriesRef = FireBaseController.entryBase
//        entriesRef.observeEventType(.Value, withBlock: { (snap) -> Void in
//            print("entries: \(snap.value)")
//            textField.text = snap
//        })
//    }

    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        let text = textField.text
        
        FireBaseController.entryBase.setValue(text)

        
    }

}

