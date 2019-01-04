//
//  SearchViewController.swift
//  Representatives
//
//  Created by Taylor Mott on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var statePickerView: UIPickerView!
    
    var resultsReps: [Representative] = []
    //MARK: - Properties
    let states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    
    @IBAction func serchButtonTapped(sender: AnyObject) {
        
        let index  = self.pickerView.selectedRowInComponent(0)
        
        let stateString = self.states[index]
        
        RepresentativeController.searchRepsByState(stateString) { (representatives) in
            
            if representatives.count > 0 {
                self.resultsReps = representatives
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.performSegueWithIdentifier("resultsSegue", sender: self)
                })
                
            } else {
                print("There was an error searching for reps.")
            }
        }
        
        
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "resultsSegue" {
            let resultsTableViewController = segue.destinationViewController as!
            ResultsTableViewController
            
            resultsTableViewController.representatives = self.resultsReps
        }
        
    }
    
    // MARK: - UIPicker Protocol Methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.states.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.states[row]
    }
    
    
}
