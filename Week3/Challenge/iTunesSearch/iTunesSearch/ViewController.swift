//
//  ViewController.swift
//  iTunesSearch
//
//  Created by Kaleo Kim on 2/17/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var firstResultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchButtonTapped(sender: AnyObject) {
        
        let searchController = SearchResultsController()
        
        searchController.searchResultsforTerm(searchTextField.text!) { (results) -> Void in
            print("I have results")
        }
        
    }

}

