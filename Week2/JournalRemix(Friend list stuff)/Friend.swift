//
//  Friend.swift
//  JournalRemix(Friend list stuff)
//
//  Created by Kaleo Kim on 2/8/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Friend {
    
    private let nameKey = "nameKey"
    private let ageKey = "ageKey"
    private let descriptionKey = "descriptionKey"
    
    let name: String
    let age: String
    let description: String
    
    init(name: String, age: String, description: String) {
        self.name = name
        self.age = age
        self.description = description
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[nameKey] as? String,
            let age = dictionary[ageKey] as? String,
            let description = dictionary[descriptionKey] as? String else {
                
                self.name = ""
                self.age = ""
                self.description = ""
                
                return nil
        }
        
        self.name = name
        self.age = age
        self.description = description
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        let dictionary = [
            nameKey: self.name,
            ageKey: self.age,
            descriptionKey: self.description
        ]
        
        return dictionary
    }
    
}



















