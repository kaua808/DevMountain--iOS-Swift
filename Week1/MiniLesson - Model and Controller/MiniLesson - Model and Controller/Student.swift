//
//  Student.swift
//  MiniLesson - Model and Controller
//
//  Created by Kaleo Kim on 2/4/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

// added NSObject and NSCoding for adding NSCoding stuff
class Student: NSObject, NSCoding{
    
    private let firstNameKey = "firstNameKey"
    private let lastNameKey = "LastNameKey"
    private let ageKey = "ageKey"
    
    let firstName: String
    let lastName: String
    let age: String
    
    init(firstName: String, lastName: String, age: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        
    }
    
    // NSCoding
    // pulling things out of the plist
    @objc required init?(coder aDecoder: NSCoder) {
        guard let firstName = aDecoder.decodeObjectForKey(firstNameKey) as? String else{
            self.firstName = ""
            self.lastName = ""
            self.age = ""
            super.init()
            return nil
        }
        self.firstName = firstName
        self.lastName = aDecoder.decodeObjectForKey(lastNameKey) as! String
        self.age = aDecoder.decodeObjectForKey(ageKey) as! String
        super.init()
    }
    
    // puts things intot the plist
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: firstNameKey)
        aCoder.encodeObject(self.lastName, forKey: lastNameKey)
        aCoder.encodeObject(self.age, forKey:  ageKey)
    }
    
    
//    init?(dictionary: [String: AnyObject]) {
//        guard let firstName = dictionary[firstNameKey] as? String,
//                let lastName = dictionary[lastNameKey] as? String,
//            let age = dictionary[ageKey] as? String else {
//                
//                self.firstName = ""
//                self.lastName = ""
//                self.age = ""
//                
//                return nil
//        }
//        
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = age
//    }
//    
//    func dictionaryCopy() -> Dictionary<String, AnyObject> {
//        let dictionary = [
//            firstNameKey: self.firstName,
//            lastNameKey: self.lastName,
//            ageKey: self.age
//        ]
//        
//        return dictionary
//    }
    
    
    
    
}

