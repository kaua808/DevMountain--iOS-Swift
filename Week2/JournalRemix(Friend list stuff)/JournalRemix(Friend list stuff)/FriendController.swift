//
//  FriendController.swift
//  JournalRemix(Friend list stuff)
//
//  Created by Kaleo Kim on 2/8/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class FriendController {
    
    private let friendKey = "friends"
    
    static let sharedInstance = FriendController()
    
    var friends: [Friend]
    
    init() {
        friends = []
    }
    
    func addFriend(friend: Friend) {
        friends.append(friend)
    }
    
    func removeFriend(friend: Friend) {
        if let friendIndex = friends.indexOf(friend) {
            friends.removeAtIndex(friendIndex)
        }
    }
    
}