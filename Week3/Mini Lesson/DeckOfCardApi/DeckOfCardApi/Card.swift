//
//  Card.swift
//  DeckOfCardApi
//
//  Created by Kaleo Kim on 2/17/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Card {
    
    private let valueKey = "value"
    private let suiteKey = "suit"
    private let imageURLStringKey = "image"
    
    var value: String
    var suite: String
    var imageURLString: String
    
    // take in a json and spit out a card
    init?(jsonDictionary: [String: AnyObject]) {
        
        guard let value = jsonDictionary[valueKey] as? String,
            let suite = jsonDictionary[suiteKey] as? String,
            let image = jsonDictionary[imageURLStringKey] as? String else {
                self.suite = ""
                self.value = ""
                self.imageURLString = ""
                
                return
        }
        self.value = value
        self.suite = suite
        self.imageURLString = image
        
    }
    
}