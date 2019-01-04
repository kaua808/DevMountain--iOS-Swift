//
//  Person.swift
//  Strech Problem 1 - optionals
//
//  Created by Kaleo Kim on 2/2/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var favColor: String?
    var favMovie: String?
    
    init(name: String) {
        self.name = "Kaleo"
        self.favColor = "Cyan"
    }
    
    func description() -> String {
        return "MY name is \(name). my fav color is \(favColor) my fav movie is \(favMovie)"
    }
    
    
}



