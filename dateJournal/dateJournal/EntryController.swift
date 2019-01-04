//
//  EntryController.swift
//  dateJournal
//
//  Created by Kaleo Kim on 3/11/17.
//  Copyright © 2017 Kaleo Kim. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entryKey = "entries"
    
    static let shared = EntryController()
    
    var entries: [Entry]
    
    init() {
        entries = []
        self.loadFromPersistentStorage()
    }
    
    func addEntry(_ entry: Entry) {
        entries.append(entry)
        self.saveToPersisentStorage()
    }
    
    func removeEntry(_ entry: Entry) {
        if let entryIndex = entries.index(of: entry) {
            entries.remove(at: entryIndex)
        }
    }
    
    func saveToPersisentStorage() {
        let entryDictionary = self.entries.map({$0.dictionaryCopy()})
        
        UserDefaults.standard.set(entryDictionary, forKey: entryKey)
    }
    
    func loadFromPersistentStorage() {
        
        let entryDictionaryFromDefaults = UserDefaults.standard.object(forKey: entryKey) as? [[String: AnyObject]] //[Dictionary<String, AnyObject>]
        
        if let entryDictionary = entryDictionaryFromDefaults {
            self.entries = entryDictionary.map({Entry(dictionary: $0)!})
        }
        
    }
}







