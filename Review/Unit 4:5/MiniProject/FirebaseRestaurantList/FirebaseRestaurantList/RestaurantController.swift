//
//  RestaurantController.swift
//  FirebaseRestaurantList
//
//  Created by Kaleo Kim on 4/28/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class RestaurantController {
    
    static let sharedInstance = RestaurantController()
    
    var restaurants: [Restaurant]
    
    init() {
        
        self.restaurants = []
        self.observeRestaurants { (restaurants) in
            self.restaurants = restaurants
            NSNotificationCenter.defaultCenter().postNotificationName("restaurantUpadte", object: nil)
        }
        
    }
    
    func addRestaurant(name: String, category: String) {
        
        let restaurant = Restaurant(name: name, category: category)
        self.addRespotauratToFirebase(restaurant)
        
    }
    
    func deleteRestaurant(restaurant: Restaurant) {
        if let index = restaurants.indexOf(restaurant) {
            restaurants.removeAtIndex(index)
        }
    }
    
    private func addRespotauratToFirebase(restaurant: Restaurant) {
        var restaurant = restaurant
        restaurant.save()
    }
    
    private func observeRestaurants(completion: (restaurants: [Restaurant]) -> Void) {
        FirebaseController.base.childByAppendingPath("Restaurants").observeEventType(.Value, withBlock: { (snapshot) in
            guard let restaurantDictionary = snapshot.value as? [String: [String: AnyObject]] else {
                completion(restaurants: [])
                return
            }
            
            let restaurants = restaurantDictionary.flatMap({Restaurant(dictionary: $1, identifier: $0)})
            completion(restaurants: restaurants)
        })
    }
}
