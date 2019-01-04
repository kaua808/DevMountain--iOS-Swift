//
//  SearchSubredditViewController.swift
//  Reddit Stretch Problem
//
//  Created by Kaleo Kim on 3/28/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class SearchSubredditViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchButtonTapped(sender: AnyObject) {
        
        SubredditController.subredditBySearchTerm(searchTextField.text!) { (result) in
            
            print(result)
            
        }
        
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
