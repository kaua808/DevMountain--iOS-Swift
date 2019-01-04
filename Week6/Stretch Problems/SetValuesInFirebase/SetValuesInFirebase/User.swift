//
//  User.swift
//  SetValuesInFirebase
//
//  Created by James Pacheco on 3/7/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class User: FirebaseType {
    let kUsername: String = "username"
    let kConversations: String = "conversations"
    
    let username: String
    var conversationIDs: [String] = []
    var conversations: [Conversation] = []
    var identifier: String?
    var endpoint: String {
        // TODO: - set endpoint
        return "users"
    }
    
    var jsonValue: [String: AnyObject] {
        // TODO: - create jsonValue that will be stored in firebase
        return [kUsername: username, kConversations: conversationIDs]
        

        
    }
    
    init(username: String) {
        self.username = username
    }
    
    required init?(json: [String : AnyObject], identifier: String) {
        guard let username = json[kUsername] as? String else {
            self.username = ""
            return nil
        }
        self.identifier = identifier
        self.username = username
    }
}