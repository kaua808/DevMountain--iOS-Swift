//: Playground - noun: a place where people can play

import UIKit

// Create a function that takes an array of integers and prints the array in reverse
func reverse(arr: [Int]) -> [Int] {
    
    var newArr = [Int]()
    
    for num in arr {
        newArr.insert(num, atIndex: 0)
    }
    
    return newArr
}

print(reverse([1, 2, 3, 4, 5, 6]))

