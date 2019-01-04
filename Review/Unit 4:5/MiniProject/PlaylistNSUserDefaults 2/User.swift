//
//  User.swift
//  PlaylistNSUserDefaults
//
//  Created by Kaleo Kim on 5/2/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation

class User: FirebaseType {
    
    private let kUsername = "username"
    
    var username: String
    var identifier: String?
    var endpoint: String {
        return "users"
    }
    
    var jsonValue: [String : AnyObject] {
        return [kUsername: username]
    }
    
    init(username: String, identifier: String? = nil) {
        self.username = username
        self.identifier = identifier
    }
    
    required init?(json: [String : AnyObject], identifier: String) {
        guard let username = json[kUsername] as? String else { return nil }
            self.username = username
            self.identifier = identifier

    }
}