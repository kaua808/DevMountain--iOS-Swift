//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

func changeMyName(name: String, completion: (success: Bool, name: String) -> Void) {
    
    dispatch_async(dispatch_queue_create("something", nil)) { () -> Void in
        let randomNum = arc4random_uniform(2)
        print(randomNum)
        if randomNum == 1 {
            let newName = "Kaleo the great"
            completion(success: true, name: newName)
        } else {
            completion(success: false, name: name)
        }
    }
}

changeMyName("Kaleo the lesser") { (success, name) -> Void in
    if success {
        print("Your name has been changed to \(name)")
    } else {
        print("Your name could not be changed")
    }
    XCPlaygroundPage.currentPage.finishExecution()
}

// Black Diamond

//func myMap<T>(inout a: T, inout _ b: T) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}


















