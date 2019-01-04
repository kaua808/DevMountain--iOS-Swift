//
//  ThirdViewController.swift
//  Apple View Controllers (image picker, mail, action, etc)
//
//  Created by Kaleo Kim on 2/25/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit
import SafariServices

class ThirdViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBAction func shareButtonTapped(sender: AnyObject) {
        
        if let text = textField.text, url = NSURL(string: text) {
            let viewControler = SFSafariViewController(URL: url)
        
            presentViewController(viewControler, animated: true, completion: nil)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
