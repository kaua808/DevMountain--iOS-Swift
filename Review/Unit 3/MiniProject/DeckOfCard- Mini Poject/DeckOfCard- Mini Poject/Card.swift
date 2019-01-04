//
//  Card.swift
//  DeckOfCard- Mini Poject
//
//  Created by Kaleo Kim on 4/18/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Card {
    
    private let kSuit = "suit"
    private let kValue = "value"
    private let kImage = "image"
    
    let suit: String
    let value: String
    let imageEndpoint: String
    
    init(suit: String, value: String, imageEndpoint: String) {
        
        self.suit = suit
        self.value = value
        self.imageEndpoint = imageEndpoint
        
    }
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let suit = dictionary[kSuit] as? String,
            let value = dictionary[kValue] as? String,
            let imageEndpoint = dictionary[kImage] as? String else {
                return  nil
        }
        
        self.suit = suit
        self.value = value
        self.imageEndpoint = imageEndpoint
        
    }
}