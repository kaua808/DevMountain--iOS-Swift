//
//  Restaurant.swift
//  FirebaseIntroMiniLesson
//
//  Created by Jordan Nelson on 2/29/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation

class Restaurant {
    
    private let nameKey = "name"
    private let categoryKey = "category"
    private let addressKey = "address"
    
    var name: String
    var category: String
    var address: String
    
    // LOCAL INIT
    init(name: String, category:String, address: String) {
        self.name = name
        self.category = category
        self.address = address
    }
    
    // INIT FROM FIREBASE
    init?(dictionary:[String:AnyObject]) {
        
        guard let name = dictionary["name"] as? String,
            let category = dictionary["category"] as? String,
            let address = dictionary["address"] as? String else {
                self.name = ""
                self.category = ""
                self.address = ""
                return
        }
        self.name = name
        self.category = category
        self.address = address
    }
    
    // SAVE TO FIREBASE
    func dictionaryCopy() -> [String:AnyObject] {
        return [nameKey:name,
            categoryKey:category,
            addressKey: address]
    }
}

