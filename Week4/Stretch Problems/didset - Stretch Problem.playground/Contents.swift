//: Playground - noun: a place where people can play

import UIKit
import Foundation

/*
Verify if person object is old enough to enter sweepstakes
1. Create a Person class that has a private var called ageChangeCount type Int, and two properties called "name" type String, and "age" type Int.
2. Create an initializer that initializes the name property only.
3. On the age variable implement the willSet and didSet methods.
4. For the willSet method check 3 things. First verify if the ageChangeCount is 3 or greater, if so then print out "Too many age changes. Ask your parents" and return from willSet method. Then verify that the age is 21 or older. If the age is 21 or older print out the persons name and that they are old enough to enter the sweepstakes. If they are not 21 or older print the persons name and that they are not old enough to enter the sweepstakes.
5. In the didSet method check to see if the age property is the same as the previous age value. If it is not the same then increase the ageChangeCount and print out the persons name and how many times they have changed their age.
6. Create a person object and give them an age. Then reassign the age property of that person to another age several times. Verify your results in the console.
Black Diamond
Open up a version of either Journal or Task that uses NSUserDefaults or NSCoding (you may need to change the head in tower.) And DidSet to your Task or enterArray in the sharedController that will send an NSNotification when the array changes. In your listTableViewController, remove the ''tableView.reloadData()'' that should be in the viewDidLoad or viewWillLoad. Now add this controller as an observer to your NSNotification and reload your tableview whenever the notification is received.
Hint: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html

*/


class Person {
    
    private var ageChangedCount: Int = 0
    
    let name: String
    var age: Int = 0 {
        
        willSet {
            if ageChangedCount >= 3 {
                print ("Too many age changes. Ask your parents")
            }
            if newValue >= 21 {
                print("\(name) you are old enough to enter into the sweep stakes!")
            } else {
                print("\(name) you are not old enough to enter")
            }
        } didSet {
            if age != oldValue {
                ageChangedCount++
                print("\(name) you have changed you age \(ageChangedCount) times")
            }
        }
    }
    
    init(name: String) {
        
        self.name = name
        
    }
    
}

let newPerson = Person(name: "Kaleo")
newPerson.age = 13
newPerson.age = 14
newPerson.age = 15
newPerson.age = 25
newPerson.age = 18







