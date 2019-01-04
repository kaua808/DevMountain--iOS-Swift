//
//  UserController.swift
//  PlaylistNSUserDefaults
//
//  Created by Kaleo Kim on 5/2/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import Firebase

class UserController {
    
    static var currentUser: User? 
    
    static func createUser(username: String, email: String, password: String, completion: (user: User?) -> Void) {
        
        FirebaseController.base.createUser(email, password: password) { (error, userData) in
            if let error = error {
                print("\(#function):" + error.localizedDescription)
                completion(user: nil)
            } else {
                guard let uid = userData["uid"] as? String else {
                    completion(user: nil)
                    return
                }
                var user = User(username: username, identifier: uid)
                user.save()
                authUser(email, password: password, completion: { (user) in
                    guard let user = user else {
                        print("\(#function); user not logged in"  )
                        completion(user: nil)
                        return
                    }
                    completion(user: user)
                })
            }
        }
        
    }
    
    static func authUser(email: String, password: String, completion: (user: User?) -> Void) {
        
        FirebaseController.base.authUser(email, password: password) { (error, authData) in
            if let error = error {
                print("\(#function):" + error.localizedDescription)
                self.currentUser = nil
                completion(user: nil)
            } else {
                guard let uid = authData.uid else {
                    self.currentUser = nil
                    completion(user: nil)
                    return
                }
                userForIdentifier(uid, completion: { (user) in
                    self.currentUser = user
                    completion(user: user)
                })
            }
        }
        
    }
    
    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        
        FirebaseController.base.childByAppendingPath("users").childByAppendingPath(identifier).observeSingleEventOfType(.Value, withBlock: { (data) in
            guard let value = data.value as? [String: AnyObject],
                user = User(json: value, identifier: identifier) else {
                    print("no user data returned for uid \(identifier)")
                    completion(user: nil)
                    return
            }
            completion(user: user)
        })
        
    }
}
