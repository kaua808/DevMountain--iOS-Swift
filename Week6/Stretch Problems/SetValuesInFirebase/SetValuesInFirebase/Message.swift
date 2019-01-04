//
//  Message.swift
//  SetValuesInFirebase
//
//  Created by James Pacheco on 3/7/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class Message: FirebaseType {
    
    let kConversation: String = "conversation"
    let kText: String = "text"
    let kSender: String = "sender"
    
    let conversationID: String
    let text: String
    let senderID: String
    var sender: User?
    
    var identifier: String?
    var endpoint: String {
        // TODO: - return endpoint for conversations
        return "messages"
    }
    
    var jsonValue: [String: AnyObject] {
        //TODO: - create dictionary that will be stored in firebase
        return [kConversation: conversationID, kText: text, kSender: senderID]
    }
    
    init(text: String, senderID: String, conversationID: String) {
        self.text = text
        self.senderID = senderID
        self.conversationID = conversationID
    }
    
    required init?(json: [String : AnyObject], identifier: String) {
        guard let text = json[kText] as? String,
            senderID = json[kSender] as? String,
            conversationID = json[kConversation] as? String else {
                self.conversationID = ""
                self.text = ""
                self.senderID = ""
                return nil
        }
        self.text = text
        self.senderID = senderID
        self.conversationID = conversationID
    }

}