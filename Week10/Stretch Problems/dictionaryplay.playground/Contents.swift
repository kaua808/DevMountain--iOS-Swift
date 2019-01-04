//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person {
    
    let kName = "name"
    let kAge = "age"
    let kEyeColor = "eyecolor"
    let kHeight = "height"
    let kGradeCompleted = "grade"
    
    let name: String
    let age: Int
    let eyeColor: String
    let height: Double
    var gradeCompleted: Int?
    var dictionaryCopy: [String: AnyObject] {
        var dictionary: [String: AnyObject] = [kName: name, kAge: age, kEyeColor: eyeColor, kHeight: height]
        
        if let grade = gradeCompleted {
            dictionary[kGradeCompleted] = grade
        }
        return dictionary
    }
    
    init(name: String, age: Int, eyeColor: String, height: Double, gradeCompleted: Int?) {
        self.name = name
        self.age = age
        self.eyeColor = eyeColor
        self.height = height
        self.gradeCompleted = gradeCompleted
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String,
            let age = dictionary[kAge] as? Int,
            let eyeColor = dictionary[kEyeColor] as? String,
            let height = dictionary[kHeight] as? Double else { return nil }
        
        
        self.name = name
        self.age = age
        self.eyeColor = eyeColor
        self.height = height
        self.gradeCompleted = dictionary[kGradeCompleted] as? Int
        
        
    }
    
}


let kaleo = Person(name: "Kaleo", age: 26, eyeColor: "Brown", height: 5.8, gradeCompleted: nil)

var dictionaryCopyOfKaleo = kaleo.dictionaryCopy
print(dictionaryCopyOfKaleo)

let kaleoCopy = Person(dictionary: dictionaryCopyOfKaleo)
print(kaleoCopy?.name)

if let kaleo = kaleoCopy {
    print(kaleo.name)
}











