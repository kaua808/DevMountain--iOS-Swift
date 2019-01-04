//
//  PersistenceController.swift
//  ProtocolStretch
//
//  Created by Kaleo Kim on 2/29/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

protocol PersistenceType {
    
    var key: String {get set}
    var objectAsDictionary: [String: AnyObject] {get}
    
    func save()
    func delete()
    
}

extension PersistenceType {
    func save() {
        NSUserDefaults.standardUserDefaults().setValue(objectAsDictionary, forKey: key)
    }
    
    func delete() {
        NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
    }
}