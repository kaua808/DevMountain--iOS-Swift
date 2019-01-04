//
//  RestaurantController.swift
//  FirebaseIntroMiniLesson
//
//  Created by Kaleo Kim on 2/29/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import Firebase

public let RestaurantsUpdatedNotification = "RestaurantsUpdatedNotificationName"

class RestaurantController {
    
    static let sharedController = RestaurantController()
    
    var restaurants: [Restaurant] {
        didSet {
            let nc = NSNotificationCenter.defaultCenter()
            nc.postNotificationName(RestaurantsUpdatedNotification, object: self)
            
        }
    }
    
    init() {
        self.restaurants = []
        loadRestaurants()
    }
    
    func loadRestaurants() {
        
        FirebaseController.restaurantRef.observeEventType(.Value, withBlock: { (snap) -> Void in
            
            for restaurantDictionary in snap.children {
                
                if let restaurantSnap = restaurantDictionary as? FDataSnapshot, let unwrappedRestaurant = restaurantSnap.value as? [String: AnyObject] {
                    if let restaurant = Restaurant(dictionary: unwrappedRestaurant) {
                        self.restaurants.append(restaurant)
                    }
                }
            }
            
        })
        
    }
    
    func addRestaurant(restaurant: Restaurant) {
        
        let newRestaurantRef = FirebaseController.restaurantRef.childByAutoId()
        newRestaurantRef.setValue(restaurant.dictionaryCopy())
    }
    
}

