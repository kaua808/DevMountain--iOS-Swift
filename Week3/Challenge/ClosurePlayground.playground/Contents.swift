//: Playground - noun: a place where people can play

import UIKit



let myClosure = { print("Hi everyone") }

struct Person {
    let firstName: String
    let lastName: String
    let age: Int
    
    func greet(salutation: () -> Void) {
        
        salutation()
    }

    func highFive() {
        print("raising hand, clapping it with the other person's hoand")
    }
}

let john = Person(firstName: "John", lastName: "Jacob", age: 25)
let james = Person(firstName: "James", lastName: "Franco", age: 34)
let kaleo = Person(firstName: "Kaleo", lastName: "Kim", age: 25)

john.greet { () -> Void in
    print("hows it going?")
    
    john.highFive()
}

let peopleArray = [john, james, kaleo]

let firstNames = peopleArray.map({$0.firstName})
let lastNames = peopleArray.map({$0.lastName})
//print(firstNames)
//print(lastNames)

let ageOrder = peopleArray.map({$0.age}).sort(<)
let agesorte = peopleArray.sort({$0.age < $1.age})
//print(ageOrder)
print(agesorte)

let filterPeopled = peopleArray.filter({$0.age < 30})
print(filterPeopled)