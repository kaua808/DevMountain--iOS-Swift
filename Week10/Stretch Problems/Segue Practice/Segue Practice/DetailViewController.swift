//
//  DetailViewController.swift
//  Segue Practice
//
//  Created by Kaleo Kim on 4/11/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var textToUse: String?
    
    
    @IBOutlet var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = textToUse
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
