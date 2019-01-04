//
//  UserController.swift
//  SetValuesInFirebase
//
//  Created by James Pacheco on 3/7/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class UserController {
    static let currentUserID = "fB0284h29"
    
    static func fetchUserForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        FirebaseController.base.childByAppendingPath("users/\(identifier)").observeSingleEventOfType(.Value, withBlock: { (data) -> Void in
            if let userDictionary = data.value as? [String: AnyObject] {
                if let user = User(json: userDictionary, identifier: identifier) {
                    completion(user: user)
                } else {
                    completion(user: nil)
                }
            } else {
                completion(user: nil)
            }
        })
    }
    
    static func observeConversationsForUser(user: User, completion: () -> Void) {
        if let identifier = user.identifier {
            FirebaseController.base.childByAppendingPath("users/\(identifier)/conversations").observeEventType(.ChildAdded, withBlock: { (data) -> Void in
                if let conversationDictionary = data.value as? [String: AnyObject] {
                    if let conversationID = Array(conversationDictionary.keys).first {
                        user.conversationIDs.append(conversationID)
                        ConversationController.fetchConversationForIdentifier(conversationID, completion: { (conversation) -> Void in
                            if let conversation = conversation {
                                user.conversations.append(conversation)
                                completion()
                            }
                        })
                    }
                }
            })
        }
    }
    
//    static func createUser(use)
    
}