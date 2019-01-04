//: Playground - noun: a place where people can play

import UIKit

class Car {
    
    private let makeKey = "make"
    private let modelKey = "model"
    private let yearKey = "year"
    
    let make: String
    let model: String
    let year: Int
    
    var fullDescription: String {
        return "\(year) \(make) \(make)"
    }
    
    var dictionaryRepresentation: [String: AnyObject]/*Dictionary <String, AnyObject>*/ {
        let carDictionary: [String: AnyObject] = [makeKey: self.make as AnyObject,
                            modelKey: self.model as AnyObject,
                            yearKey: self.year as AnyObject]
        
        return carDictionary
    }
    
    init(make: String, model: String, year: Int) {
        
        self.make = make
        self.model = model
        self.year = year
    }
    
    init?(dictoinary: [String: AnyObject]) {
        guard let make = dictoinary[makeKey] as? String,
            let model = dictoinary[modelKey] as? String,
            let year = dictoinary[yearKey] as? Int else{
                
                self.make = ""
                self.model = ""
                self.year = 0
                return nil
                
        }
        
            self.make = make
        self.model = model
        self.year = year
        
    }
}

// Class to Dictionary

let myCar = Car(make: "Honda", model: "Accord", year: 1990)

print(myCar.dictionaryRepresentation)



//Dictionary to Class

let dreamCarDictionary = ["makeKey": "Toyota", "modelKey": "4Runner", "yearKey": 2015] as [String : Any]
let dreamCar = Car(dictoinary: dreamCarDictionary as [String : AnyObject])

// Loop Car

let lameCar = Car(make: "Mercede", model: "Benz", year: 2016)

let lameCarDictionary = lameCar.dictionaryRepresentation

let secondLameCar = Car(dictoinary: lameCarDictionary)



