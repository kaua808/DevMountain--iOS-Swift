//
//  Conversation.swift
//  SetValuesInFirebase
//
//  Created by James Pacheco on 3/7/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class Conversation: FirebaseType {
    
    let kName: String = "name"
    let kUsers: String = "users"
    
    let name: String
    var usersIDs: [String] = []
    var users: [User] = []
    var identifier: String?
    var endpoint: String {
        // TODO: - return endpoint for conversations
        return "conversations"
    }
    
    var jsonValue: [String: AnyObject] {
        //TODO: - create dictionary that will be stored in firebase
        return [kName: name, kUsers: usersIDs]
    }
    
    init(name: String, users: [User]) {
        self.name = name
        self.users = users
        var identifiers: [String] = []
        for user in users {
            if let identifier = user.identifier {
                identifiers.append(identifier)
            }
        }
        self.usersIDs = identifiers
    }
    
    required init?(json: [String: AnyObject], identifier: String) {
        guard let name = json[kName] as? String else {
            self.name = ""
            return nil
        }
        self.name = name
        self.identifier = identifier
        if let usersDictionary = json[kUsers] as? [String: AnyObject] {
            usersIDs = Array(usersDictionary.keys)
        }
    }
}