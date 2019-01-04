//
//  Person.swift
//  ProtocolStretch
//
//  Created by James Pacheco on 2/28/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class Person: PersonProtocol {
    let firstName: String
    let lastName: String
    let age: Int
    var fullName: String {
        return firstName + " " + lastName
    }
    
    var key: String
    
    var objectAsDictionary: [String: AnyObject] {
        return ["firstName":firstName, "lastName":lastName, "age":age]
    }
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.key = "Person\(NSDate())"
    }
    
    init?(dictionary: [String: AnyObject], key: String) {
        guard let firstName = dictionary["firstName"] as? String,
            lastName = dictionary["lastName"] as? String,
            age = dictionary["age"] as? Int else {
                self.firstName = ""
                self.lastName = ""
                self.age = 0
                self.key = key
                return nil
        }
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.key = key
    }
}