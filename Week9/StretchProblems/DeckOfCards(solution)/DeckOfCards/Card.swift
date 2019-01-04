//
//  Card.swift
//  DeckOfCards
//
//  Created by James Pacheco on 12/8/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

import UIKit

struct Card {
    let value: String
    let suit: String
    let imageURL: NSURL
    
    init?(cardDictionary: [String: AnyObject]) {
        guard let value = cardDictionary["value"] as? String else {return nil}
        guard let suit = cardDictionary["suit"] as? String else {return nil}
        guard let imageURLString = cardDictionary["image"] as? String else {return nil}
        guard let imageURL = NSURL(string: imageURLString) else {return nil}
        
        self.value = value
        self.suit = suit
        self.imageURL = imageURL
    }
}