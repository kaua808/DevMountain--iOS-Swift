//: Playground - noun: a place where people can play

import UIKit


func fibonacci(number: Int) -> (Int) {
    
    if number <= 1 {
        return number
    } else {
        return fibonacci(number - 1) + fibonacci(number - 2)
    }
}

var fibNumber = fibonacci(8)
print("Fibonacci number is: \(fibNumber)")

//func fibonacci(number: Int) -> Int {
//    var thisFib = 1
//    var lastFib = 0
//    var placeHolder = 0
//    
//    while thisFib <= number {
//        placeHolder = thisFib
//        thisFib += lastFib
//        lastFib = placeHolder
//    }
//    
//    return lastFib
//}

func newFibonacci(number: Int, fibonacci: (Int, Int) = (0, 1)) -> Int {
    return fibonacci.1 <= number ? newFibonacci(number, fibonacci: (fibonacci.1, fibonacci.0 + fibonacci.1)):fibonacci.0
}
newFibonacci(2000)









