//
//  ViewController.swift
//  DeckOfCardApi
//
//  Created by Kaleo Kim on 2/17/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var suiteValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func drawButtonTapped(sender: AnyObject) {
        
        CardController.drawACard { (card) -> Void in
            
            //card returned from API
            if let card = card {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.suiteValueLabel.text = "\(card.value) of \(card.suite)"
                })
                
                
                
                // Grab image from string on card
                NetworkcController.fetchImageAtURL(card.imageURLString, completion: { (image) -> Void in
                    if let image = image {
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.imageView.image = image
                        })
                        
                    }
                })
                
            } else {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.suiteValueLabel.text = "Error, try again"
                })
                
            }
            
        }
        
    }

}

