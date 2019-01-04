//
//  PersonController.swift
//  PairRandomizer
//
//  Created by Kaleo Kim on 3/11/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class PersonController {
    
    private let peopleKey = "people"
    
    static let sharedInstance = PersonController()
    
    var people: [Person] = []
    var randomArr: [Person] = []
    
    init() {
        self.loadFromPersistentStorage()
        self.shufflePeople()
    }
    
    func saveToPersistentStorage() {
        let personDictionary = self.people.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(personDictionary, forKey: peopleKey)
    }
    
    func shufflePeople() {
        
        randomArr = shuffleArray(people)
    }
    
    func loadFromPersistentStorage() {
        let peopleDictionaryFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(peopleKey) as? [[String: AnyObject]]
        
        if let peopleDictionary =
            peopleDictionaryFromDefaults {
            self.people = peopleDictionary.map({Person(dictionary: $0)!})
        }
    }
    
    func addPerson(person: Person) {
        people.append(person)
        self.saveToPersistentStorage()
    }
    
    func removePerson(person: Person) {
        if let personIndex = people.indexOf(person) {
            people.removeAtIndex(personIndex)
        }
    }
    
    func shuffleArray<T>(var array: [T]) -> [T] {
        for index in (0..<array.count) {
            let randomIndex = Int(arc4random_uniform(UInt32(index)))
            (array[index], array[randomIndex]) = (array[randomIndex], array[index])
        }
        
        return array
    }
    
}