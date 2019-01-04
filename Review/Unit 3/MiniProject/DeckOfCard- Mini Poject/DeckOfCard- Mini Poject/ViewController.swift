//
//  ViewController.swift
//  DeckOfCard- Mini Poject
//
//  Created by Kaleo Kim on 4/18/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func drawCardTapped(sender: AnyObject) {
        
        CardController.drawCard { (card) in
            if let card = card {
                
                ImageController.imageForURL(card.imageEndpoint, completion: { (image) in
                    if let image = image {
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.cardImageView.image = image
                        })
                    }
                })
                
            }
        }

        
    }
    

}

