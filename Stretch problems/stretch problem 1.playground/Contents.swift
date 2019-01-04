//: Playground - noun: a place where people can play

import Cocoa

class Person {
    var name: String
    var favColor: String?
    var favMovie: String?
    
    init(name: String) {
        self.name = "Kaleo"
    }
    
    func description() -> String {
        let movie = favMovie
        if let movie = favMovie = favMovie {
            print(movie)
        }
        return "MY name is \(name). my fav color is \(favColor) my fav movie is \(favMovie)"
    }
    
    
}