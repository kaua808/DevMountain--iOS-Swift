//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

/*
1. Import XCPlayground and include the following line in your playground: XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
2. Create a function called changeMyName that takes a name as a String and a closure called completion that takes a Bool called success and a String called name.
3. On the first line inside of this function, use dispatch_async to put all of the code inside your function on a background thread.
4. Create an if/else statement where 50% of the time the "if" portion will be executed and the other 50% of the time the "else" portion will be executed.
5. If the if/else statement succeeds, create a new name and pass it to the completion along with true, otherwise pass the original name along with false.
6. Call your function and using the parameters from the closure print "Your name has been changed to" the new name or "Your name could not be changed."

Black Diamond
Using a completion closure and use of generics, create your own map function that mimics the functionality of Swift's built-in map function.
*/

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

func changeMyName(name: String, completion: (success: Bool, name: String) -> Void) {
    
    dispatch_async(dispatch_queue_create("something", nil)) { () -> Void in
        let randomNum = arc4random_uniform(2)
        print(randomNum)
        if randomNum == 1 {
            let newName = "Kaleo"
            completion(success: true, name: newName)
        } else {
            completion(success: false, name: name)
        }
    }
}

changeMyName("Parker") { (success, name) -> Void in
    if success {
        print("Your name has been changed to \(name)")
    } else {
        print("Your name could not be changed")
    }
}

// Black Diamond

func myMap<T>(inout a: T, inout _ b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

















