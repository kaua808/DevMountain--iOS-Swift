//
//  NamesViewController.swift
//  LocalizationDemo
//
//  Created by Michael Mecham on 4/5/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class LocalViewController: UIViewController {

    @IBOutlet weak var basicLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Add Names"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action Buttons
    
    @IBAction func discoverButtonTapped(sender: AnyObject) {
        presentAlertController(NSLocalizedString("NamesVC.AlertTitle", comment: "Look!"), message: NSLocalizedString("NamesVC.AlertBody", comment: "that button just presents an alert"))
    }
    
    // MARK: - Alert Controller
    
    func presentAlertController(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(alertAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
