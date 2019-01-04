//
//  FirebaseController.swift
//  FirebaseIntroMiniLesson
//
//  Created by Kaleo Kim on 2/29/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    
    static let base = Firebase(url: "https://local-restaurant.firebaseio.com")
    static let restaurantRef = base.childByAppendingPath("Restaurants")
    
}

