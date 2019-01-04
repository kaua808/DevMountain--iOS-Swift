//
//  NetworkController.swift
//  DeckOfCardStretch
//
//  Created by Kaleo Kim on 3/29/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class NetworkController {
    
    let base = "http://deckofcardsapi.com/api/deck/new/"
    
    static func dataAtURL(completion: (resultsData: NSData?) -> Void) {
        
        let url = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/?count=52")!
        
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
                completion(resultsData: data)
                print(data)
            
        }
        dataTask.resume()
    }
    
    
    
}