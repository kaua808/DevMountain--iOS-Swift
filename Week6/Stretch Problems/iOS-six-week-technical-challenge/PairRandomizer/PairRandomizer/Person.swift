//
//  Person.swift
//  PairRandomizer
//
//  Created by Kaleo Kim on 3/11/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Person: Equatable {
    
    private let nameKey = "nameKey"
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[nameKey] as? String else {
            self.name = ""
            return nil
        }
        self.name = name
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        let dictionary = [nameKey: self.name]
        return dictionary
    }
    
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}