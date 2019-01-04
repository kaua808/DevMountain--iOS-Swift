//
//  EntryController.swift
//  Timeline
//
//  Created by Kaleo Kim on 3/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entryKey = "entries"
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry]
    
    init() {
        entries = []
        self.loadFromPersistentStorage()
    }
    
    func addEntry(entry: Entry) {
        self.entries.append(entry)
        self.saveToPersistentStorage()
    }
    
    func deleteEntry(entry: Entry) {
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
        }
    }
    
    func saveToPersistentStorage() {
        let entryDictionary = self.entries.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(entryDictionary, forKey: entryKey)
    }
    
    func loadFromPersistentStorage() {
        
        let entryDictionaryFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entryKey) as? [[String: AnyObject]]
        
        if let entryDictionary = entryDictionaryFromDefaults {
            self.entries = entryDictionary.map{Entry(dictionary: $0)!}
        }
        
    }
    
}