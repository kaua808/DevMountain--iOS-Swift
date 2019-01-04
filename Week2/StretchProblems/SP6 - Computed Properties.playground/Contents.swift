//: Playground - noun: a place where people can play

import UIKit

var currentDay: Int
var currentMonth: Int
var currentYear: Int

struct Birthday {
    var day: String
    var month: String
    var year: Int
}

struct Name {
    let firstName: String
    let lastName: String
}

struct Person {
    let dateOfBirth: Birthday
    let legalName: Name
    
   // var age: Int {
        
//        get {
//            let calendar = NSCalendar.currentCalendar()
//            let birthdayComponenets = NSDateComponents()
//            birthdayComponenets.day = dateOfBirth.day
//            birthdayComponenets.month = dateOfBirth.month
//        
//        }
        
//        get {
//            let date = NSDate()
//            let calendar = NSCalendar.currentCalendar()
//            let components = calendar.components([.Day, .Month, .Year], fromDate: date)
//            
//            currentYear =  components.year
//            
//            let age = currentYear - dateOfBirth.year
//            return age
//        }
//    }
}

let newPerson = Person(dateOfBirth: Birthday(day: "17", month: "April", year: 1990), legalName: Name(firstName: "Kaleo", lastName: "Kim"))

newPerson.dateOfBirth.month


let date = NSDate()
let calendar = NSCalendar.current
//let components = calendar.components([.Day, .Month, .Year], fromDate: date)
//
//let year = components.year
//let day = components.day
//let month = components.month
//
//print(year)
//print(month)
//print(day)










/*
PART 1
Make variables for currentDay, currentYear, and currentMonth (Int).
Create three Structs: Birthday, Name, and Person
Birthday should have a year, month and day
Name should have a firstName and lastName
Person should have a dateOfBirth which is set to the Birthday Struct and a legalName which is set to the Name struct
Make a new person from the Person struct
Print out their birth year, month, and day
Print out their first and last name
PART 2
Add a computed property of age: Int to the Person struct
Make a getter on the age that calculates the person's age
Make a setter on the age that updates the dateOfBirth.day and dateOfBirth.month to the current date and updates the dateOfBirth.year to currentYear - the new age
Print out their age
Update their age and then print their new dateOfBirth.year
*/

/*
var currentDay: Int
var currentYear: Int
var currentMonth: Int
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
    let legalName: Name
    var dateOfBirth: Birthday
    var age: Int {
        get{
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Day, .Month, .Year], fromDate: NSDate())
            if components.month > dateOfBirth.month {
                return components.year - dateOfBirth.year
            } else if components.month == dateOfBirth.month {
                if components.day >= dateOfBirth.day {
                    return components.year - dateOfBirth.year
                } else {
                    return components.year - dateOfBirth.year - 1
                }
            } else {
                return components.year - dateOfBirth.year - 1
            }
        }
        
        set {
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Day, .Month, .Year], fromDate: NSDate())
            let month = components.month
            let day = components.day
            let year = components.year - newValue
            dateOfBirth.month = month
            dateOfBirth.year = year
            dateOfBirth.day = day
        }
    }
}
var aPerson = Person(legalName: Name(firstName: "John", lastName: "Smith"), dateOfBirth: Birthday(year: 1980, month: 1, day: 1))
print("\(aPerson.legalName.firstName) \(aPerson.legalName.lastName)")
print("\(aPerson.dateOfBirth.month) \(aPerson.dateOfBirth.day), \(aPerson.dateOfBirth.year)")
print(aPerson.age)
aPerson.age = 50
print("\(aPerson.dateOfBirth.month) \(aPerson.dateOfBirth.day), \(aPerson.dateOfBirth.year)")

*/
