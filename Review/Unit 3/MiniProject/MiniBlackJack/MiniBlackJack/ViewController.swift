//
//  ViewController.swift
//  MiniBlackJack
//
//  Created by Kaleo Kim on 4/19/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageOne: UIImageView!
    
    @IBOutlet var imageTwo: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        CardController.drawCards(4) { (card) in
//            print(card)
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        
        GameController.playGame { (winner, playerCard, computerCard) in
            ImageController.imageAtURL(playerCard.imageEndpoint, completion: { (image) in
                self.imageOne.image = image
            })
            ImageController.imageAtURL(computerCard.imageEndpoint, completion: { (image) in
                self.imageTwo.image = image
            })
            var resultText = ""
            if winner == .Player {
                resultText = "You Win"
            } else if winner == .Tie {
                resultText = "You tied"
            } else {
                resultText = "you lose"
            }
            
            let alert = UIAlertController(title: resultText, message: nil, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }

}

