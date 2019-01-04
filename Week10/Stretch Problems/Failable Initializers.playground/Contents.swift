//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//anytime you take something out of a dictionary is always an optional

let workingDict = ["nameKey" : "Derek", "ageKey": 28, "favMovieKey" : "Zoolander"]

class Person {
    
    let name: String
    let age: Int
    let favoriteMovie: String
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let name = dictionary["nameKey"] as? String,
            let age = dictionary["ageKey"] as? Int,
            let favoriteMovie = dictionary["favMovieKey"] as? String else{
                
//                self.name = ""
//                self.age = 0
//                self.favoriteMovie = ""
                
                return nil
            }
        
        self.name = name
        self.age = age
        self.favoriteMovie = favoriteMovie
        
    }
    
//    init(dictionary: [String: AnyObject]) {
//        
//        if let name = dictionary["nameKey"] as? String,
//        let age = dictionary["ageKey"] as? Int,
//        let favoriteMovie = dictionary["favMovieKey"] as? String {
//            
//            self.name = name
//            self.age = age
//            self.favoriteMovie = favoriteMovie
//        
//        }
//    
//    }

}