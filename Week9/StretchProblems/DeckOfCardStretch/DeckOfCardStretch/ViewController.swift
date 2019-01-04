//
//  ViewController.swift
//  DeckOfCardStretch
//
//  Created by Kaleo Kim on 3/29/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDeck" {
            let deckCollectionView = segue.destinationViewController as! DeckCollectionViewController

            DeckController.getDeck { (card) in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    deckCollectionView.deck = card
                    
                })
            }
        }
    }

}

