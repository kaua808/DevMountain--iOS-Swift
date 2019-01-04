//: Playground - noun: a place where people can play

import UIKit

let date = NSDate()
let calendar = NSCalendar.currentCalendar()
let components = calendar.components([.Month, .Day, .Year], fromDate: date)
var currentDAy: Int = Int(components.day)
var currentMonth: Int = Int(components.month)
var currentYear: Int = Int(components.year)

struct Birthday {
    var year: Int
    var month: Int
    var day: Int
    
}

struct Name {
    let firstName: String
    let lastName: String
    
}

struct Person {
    
    var dateOfBirth: Birthday
    var legalName: Name
    var age: Int {
        get {
            if currentMonth >= dateOfBirth.month && currentDAy >= dateOfBirth.day {
                return currentYear - dateOfBirth.year
            }
            
            return currentYear - dateOfBirth.year - 1
        }
        set {
            dateOfBirth.day = currentDAy
            dateOfBirth.month = currentMonth
            dateOfBirth.year = currentYear - newValue
        }
        
    }
    
}

var newPerson = Person(dateOfBirth: Birthday(year: 1990, month: 4, day: 17), legalName: Name(firstName: "Kaleo", lastName: "Kim"))

print(newPerson.dateOfBirth)
print(newPerson.legalName)

print(newPerson.age)

newPerson.age = 55

print(newPerson.dateOfBirth.year)





