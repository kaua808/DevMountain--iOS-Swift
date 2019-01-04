//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let intArr = [1,2,3,4,26,6,7,51,9,10]

func highLow(arr: [Int]) {
    
    for num in arr {
        
        var statement1 = ""
        var statement2 = ""
        
        statement1 = num < 50 ? "\(num) is low" : "\(num) is high"
        
        statement2 = num % 13 == 0 ? "didnt learn this in school" : "thats easy"
     
        print(statement1, statement2)
    }
    
}

highLow(intArr)

func biggerOrSmaller(arr: [Int]) {
    
    var placeHolderNum = 0
    
    for num in arr {
        num > placeHolderNum ? print("\(placeHolderNum) -> \(num) getting bigger") : print("\(placeHolderNum) -> \(num) getting smaller")
        
        placeHolderNum = num
        
    }
    
}

//biggerOrSmaller(intArr)

func secondHighestValue(arr: [Int]) {
    
    var highest = 0
    var secondHighest = 0
    
    for num in arr {
        if num > highest {
            secondHighest = highest
            highest = num
        }
    }
    print("\(secondHighest)")
    
}

//secondHighestValue(intArr)












