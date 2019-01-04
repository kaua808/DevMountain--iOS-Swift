//
//  FirebaseController.swift
//  PlaylistNSUserDefaults
//
//  Created by Kaleo Kim on 5/2/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    static let base = Firebase(url: "https://fireplaylist.firebaseio.com/")
}

protocol FirebaseType {
    var endpoint: String {get}
    var identifier: String? {get set}
    var jsonValue: [String: AnyObject] {get}
    
    init?(json: [String: AnyObject], identifier: String)
    
    mutating func save()
    func delete()
}

extension FirebaseType {
    mutating func save() {
        
        var newEndpoint = FirebaseController.base.childByAppendingPath(self.endpoint)
        if let identifier = identifier {
            newEndpoint = newEndpoint.childByAppendingPath(identifier)
        } else {
            newEndpoint = newEndpoint.childByAutoId()
            self.identifier = newEndpoint.key
        }
        newEndpoint.updateChildValues(jsonValue)
    }
    
    func delete() {
        guard let identifier = identifier else {return}
        FirebaseController.base.childByAppendingPath(self.endpoint).childByAppendingPath(identifier).removeValue()
    }
}













//mutating func save() {
//    var newEndpoint = FirebaseController.base.childByAppendingPath(self.endpoint)
//    if let identifier = self.identifier {
//        newEndpoint = newEndpoint.childByAppendingPath(identifier)
//    } else {
//        newEndpoint = newEndpoint.childByAutoId()
//        self.identifier = newEndpoint.key
//    }
//    newEndpoint.updateChildValues(self.jsonValue)
//}
//
//func delete() {
//    guard let identifier = self.identifier else {return}
//    FirebaseController.base.childByAppendingPath(self.endpoint).childByAppendingPath(identifier).removeValue()
//}