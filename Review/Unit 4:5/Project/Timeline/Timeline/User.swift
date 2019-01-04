//
//  User.swift
//  Timeline
//
//  Created by Kaleo Kim on 4/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class User: Equatable {
    
    var name = ""
    var bio: String?
    var url: String?
    var identifier: String?
    
    init(username: String, uid: String, bio: String? = nil, url: String? = nil) {
        
        self.name = username
        self.bio = bio
        self.url = url
        self.identifier = uid
        
    }
}

func ==(lhs: Comment, rhs: Comment) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}