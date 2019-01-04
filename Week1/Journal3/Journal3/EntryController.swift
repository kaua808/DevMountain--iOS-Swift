//
//  EntryController.swift
//  Journal3
//
//  Created by Kaleo Kim on 2/7/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entryKey = "entries"
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry]
    
    init() {
        entries = []
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
    }
    
    func removeEntry(entry: Entry) {
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
        }
    }
    
    func saveToPersistentStorage() {
        let entryDictionay = self.entries.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(entryDictionay, forKey: entryKey)
    }
    
    func loadFromPersistentStorage() {
        
        let entryDictionaryFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entryKey) as? [Dictionary<String, AnyObject>]
        
        if let entryDictionary = entryDictionaryFromDefaults {
            self.entries = entryDictionary.map({Entry(dictionary: $0)!})
        }
    }
    
}