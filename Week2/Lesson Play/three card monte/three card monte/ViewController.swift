//
//  ViewController.swift
//  three card monte
//
//  Created by Kaleo Kim on 2/10/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let choices = UIAlertController(title: "3 Card Monte", message: "Chose a number", preferredStyle: .Alert)
        
        let playAgain = UIAlertController(title: "Correct", message: "try your luck again", preferredStyle: .Alert)
        
        let wrong = UIAlertController(title: "Wrong!", message: "sorry but not sorry, try again?", preferredStyle: .Alert)
        
        let cardOne = UIAlertAction(title: "1", style: .Default) { alert -> Void in
            self.presentViewController(wrong, animated: true, completion: nil)
        }
        
        let cardTwo = UIAlertAction(title: "2", style: .Default) { two -> Void in
            self.presentViewController(wrong, animated: true, completion: nil)
        }
        
        let cardThree = UIAlertAction(title: "3", style: .Default) { correct -> Void in
            self.presentViewController(playAgain, animated: true, completion: nil)
        }
        
        let noAction = UIAlertAction(title: "no", style: .Destructive, handler: nil)
        
        let yesAction = UIAlertAction(title: "Yes", style: .Default) { yes -> Void in
            self.presentViewController(choices, animated: true, completion: nil)
        }
        
        choices.addAction(cardOne)
        choices.addAction(cardTwo)
        choices.addAction(cardThree)
        
        wrong.addAction(yesAction)
        wrong.addAction(noAction)
        
        playAgain.addAction(yesAction)
        playAgain.addAction(noAction)
        
        self.presentViewController(choices, animated: true, completion: nil)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

