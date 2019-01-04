//
//  EntryController.swift
//  Journal 2
//
//  Created by Kaleo Kim on 2/6/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

public let EntriesUpdateNotification = "EntriesUpdatedNotification"

class EntryController {
    
    private let entryKey = "entries"
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry] {
        didSet {
            let nc = NSNotificationCenter.defaultCenter()
            nc.postNotificationName(EntriesUpdateNotification, object: self)
        }
    }
    
    init() {
        entries = []
        self.loadFromPersistentStorage()
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        self.saveToPersisentStorage()
    }
    
    func removeEntry(entry: Entry) {
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
        }
    }
    
    func saveToPersisentStorage() {
        let entryDictionary = self.entries.map({$0.dictionaryCopy()})
        
        FirebaseController.entryBase.setValue(entryDictionary)
        //NSUserDefaults.standardUserDefaults().setObject(entryDictionary, forKey: entryKey)
    }
    
    func loadFromPersistentStorage() {
        
        let entriesRef = FirebaseController.entryBase
        entriesRef.observeEventType(.Value, withBlock: { (snap) -> Void in
            print("entries: \(snap.value)")
            if let entryDictionary = snap.value as? [Dictionary<String, AnyObject>] {
                self.entries = entryDictionary.map({Entry(dictionary: $0)!})
            }
        })
        
    }

}