//
//  PersonProtocol.swift
//  ProtocolStretch
//
//  Created by Kaleo Kim on 4/28/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

protocol PersonProtocol {
    
    var key: String {get set}
    var objectAsDictionary: [String: AnyObject] {get}
    
    func save()
    func delete()
}

extension PersonProtocol {
    func save() {
        NSUserDefaults.standardUserDefaults().setValue(objectAsDictionary, forKey: key)
    }
    
    func delete() {
        NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
    }
}