//
//  PersonController.swift
//  ProtocolStretch
//
//  Created by James Pacheco on 2/28/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class PersonController {
    
    static let sharedController = PersonController()
    
    var people: [Person] {
        var people: [Person] = []
        for key in peopleKeys {
            guard let personDictionary = NSUserDefaults.standardUserDefaults().valueForKey(key) as? [String: AnyObject],
                person = Person(dictionary: personDictionary, key: key) else {break}
            people.append(person)
        }
        return people
    }
    
    var peopleKeys: [String] {
        guard let keys = NSUserDefaults.standardUserDefaults().valueForKey("PeopleKeys") as? [String] else {return []}
        return keys
    }
    
    static func addPerson(firstName: String, lastName: String, age: Int) {
        let person = Person(firstName: firstName, lastName: lastName, age: age)
        person.save()
        let keys = sharedController.peopleKeys + [person.key]
        NSUserDefaults.standardUserDefaults().setValue(keys, forKey: "PeopleKeys")
    }
    
    static func deletePerson(person: Person) {
        person.delete()
        let keys = sharedController.peopleKeys.filter {$0 != person.key}
        NSUserDefaults.standardUserDefaults().setValue(keys, forKey: "PeopleKeys")
    }
}