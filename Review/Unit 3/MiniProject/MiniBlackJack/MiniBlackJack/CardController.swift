//
//  CardController.swift
//  MiniBlackJack
//
//  Created by Kaleo Kim on 4/19/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class CardController {
    
    
    
    static func drawCards(numOfCard: Int, completion: (cards: [Card]) -> Void) {
        
        let url = "http://deckofcardsapi.com/api/deck/new/draw/?count=\(numOfCard)"
        
        NetworkController.dataAtURL(url) { (success, data) in
            
            guard let data = data else { return }
            
            NetworkController.serializeData(data, completion: { (json) in
                
                guard let json = json,
                    cardArray = json["cards"] as? [[String:AnyObject]] else {completion(cards: []); return}
                
                let cards = cardArray.flatMap{Card(dictionary: $0)}
                
                completion(cards: cards)
            })
            
        }
        
    }
    
}