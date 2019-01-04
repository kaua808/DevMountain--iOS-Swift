//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let workingDict = ["nameKey" : "Derek", "ageKey" : 28, "favMovieKey" : "Zoolander"] as [String : Any]


class Person {
    
    let name: String
    let age: Int
    let favMovie: String
    
    init?(dictionary: [String: AnyObject]) {
        
        
        guard let name = dictionary["nameKey"] as? String,
                let age = dictionary["ageKey"] as? Int,
            let favMovie = dictionary["favMovieKey"] as? String else {
                self.name = ""
                self.age = 0
                self.favMovie = ""
                
                return nil
            }
                
                self.name = name
                self.age = age
                self.favMovie = favMovie
        }
    }


let derek = Person(dictionary: workingDict as [String : AnyObject])
