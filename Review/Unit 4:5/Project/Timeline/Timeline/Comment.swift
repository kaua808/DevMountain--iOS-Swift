//
//  Comment.swift
//  Timeline
//
//  Created by Kaleo Kim on 4/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Comment: Equatable {
    
    let username: String
    let text: String
    let postIdentifier: String
    var identifier: String?
    
    init(username: String, text: String, postIdentifier: String, identifier: String? = nil) {
        
        self.username = username
        self.text = text
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
    
}

func ==(lhs: Comment, rhs: Comment) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}