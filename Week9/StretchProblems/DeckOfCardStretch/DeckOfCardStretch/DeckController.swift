//
//  DeckController.swift
//  DeckOfCardStretch
//
//  Created by Kaleo Kim on 3/29/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class DeckController {
    
    static func getDeck(completion: (card: [Card]) -> Void) {
        
        NetworkController.dataAtURL { (resultsData) in
//            guard let data = resultsData else {
//                print("No data Returned")
//                completion(card: [])
//                return
//            }
            do {
                let resultsAnyObject = try NSJSONSerialization.JSONObjectWithData(resultsData!, options: .AllowFragments)
                
                if let resultsDictionary = resultsAnyObject as? [String: AnyObject], let cardArray = resultsDictionary["cards"] as? [[String: AnyObject]] {
                    
                    
                    let cardArray = cardArray.flatMap{Card(jsonDictionary: $0)}
                    print(cardArray[0].suite)
                    completion(card: cardArray)
                } else {
                   completion(card: [])
                }
            } catch {
                completion(card: [])
            }
        }
        
    }
    
}