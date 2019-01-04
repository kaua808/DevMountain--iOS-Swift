//: Playground - noun: a place where people can play

import Cocoa

class Car: Equatable {
    
    let year: String
    let make: String
    let model: String
    
    init(year: String, make: String, model: String) {

        self.year = year
        self.make = make
        self.model = model
        
    }
    

    
}

func ==(lhs: Car, rhs: Car) -> Bool {
    return lhs.year == rhs.year && lhs.make == rhs.make && lhs.model == rhs.model
}

let car1 = Car(year: "2000", make: "Honda", model: "Accord")
let car2 = Car(year: "2015", make: "Toyota", model: "Forrunner")
let car3 = Car(year: "2000", make: "Honda", model: "Accord")

if car1 == car3 {
    print("Thats the same car!")
} else {
    print("those are different cars.")
}

if car1 == car2 {
    print("Thats the same car!")
} else {
    print("those are different cars.")
}

if car1 != car2 {
    print("no equales")
}