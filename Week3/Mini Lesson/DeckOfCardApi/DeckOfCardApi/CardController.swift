//
//  CardController.swift
//  DeckOfCardApi
//
//  Created by Kaleo Kim on 2/17/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class CardController {
    
    static func drawACard(completion: (Card?) -> Void) {
        
        NetworkcController.dataAtURL { (returnedData) -> Void in
            
            guard let data = returnedData else {
                print("No data Returned")
                completion(nil)
                return
            }
            do {
                let resultsAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let resultsDictionary = resultsAnyObject as? [String: AnyObject], let cardArray = resultsDictionary["cards"] as? [[String:AnyObject]] {
                    
                        let jsonCard = cardArray[0]
                        let card = Card(jsonDictionary: jsonCard)
                        completion(card)
                } else {
                    completion(nil)
                }
                
            } catch {
                completion(nil)
            }
        }
        
    }
    
}