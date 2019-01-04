//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func fibonacci(number: Int) -> Int {
    var thisFib = 1
    var lastFib = 0
    var placeHolder = 0

    while thisFib <= number {
        placeHolder = thisFib
        thisFib += lastFib
        lastFib = placeHolder
    }

    return lastFib
}

fibonacci(2000)


func newFibonacci(number: Int, fibonacci: (Int, Int) = (0, 1)) -> Int {
    //return fibonacci.1 <= number ? newFibonacci(number, fibonacci: (fibonacci.1, fibonacci.0 + fibonacci.1)):fibonacci.0
    
    if fibonacci.1 <= number {
        return newFibonacci(number, fibonacci: (fibonacci.1, fibonacci.0))
    } else {
        return fibonacci.0
    }
}

newFibonacci(2000)