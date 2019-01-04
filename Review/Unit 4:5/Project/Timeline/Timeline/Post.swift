//
//  Post.swift
//  Timeline
//
//  Created by Kaleo Kim on 4/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Post: Equatable {
 
    let imageEndpoint: String
    let caption: String?
    let username: String
    let comments: [Comment]
    let likes: [Like]
    var identifier: String?
    
    init(imageEndpoint: String, caption: String?, username: String = "", comments: [Comment] = [], likes: [Like] = [], identifier: String? = nil) {
        
        self.imageEndpoint = imageEndpoint
        self.caption = caption
        self.username = username
        self.comments = comments
        self.likes = likes
    }

}

func ==(lhs: Comment, rhs: Comment) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}