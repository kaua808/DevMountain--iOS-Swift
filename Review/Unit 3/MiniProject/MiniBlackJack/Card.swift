//
//  Card.swift
//  MiniBlackJack
//
//  Created by Kaleo Kim on 4/19/16.
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
    var intValue: Int {
        
        switch value {
        case "KING":
            return 13
        case "QUEEN":
            return 12
        case "JACK":
            return 11
        case "ACE":
            return 14
        default:
            return Int(value)!
        }
        
    }
    
    init(suit: String, value: String, imageEndpoint: String) {
        
        self.suit = suit
        self.value = value
        self.imageEndpoint = imageEndpoint
        
    }
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let suit = dictionary[kSuit] as? String,
            let value = dictionary[kValue] as? String,
            let imageEndpoint = dictionary[kImage] as? String else { return nil }
        
        self.suit = suit
        self.value = value
        self.imageEndpoint = imageEndpoint
        
    }
    
}