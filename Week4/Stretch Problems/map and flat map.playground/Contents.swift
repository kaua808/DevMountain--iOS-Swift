//: Playground - noun: a place where people can play

import UIKit

class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


var str = "Hello, playground"

let arr = [1,2,3,4,5,6]

let mapMultiply = arr.map{$0 * 2}

let mapArrDouble = arr.map { (num) -> Double in

    return Double(num) * 2.5
    
}

let mapBool = arr.map{$0 > 2}

mapBool
mapArrDouble
mapMultiply

let newArr = [[1,2,3], [4,5,6]]

let mapNewArr = newArr.map{$0.map{$0 * 2}}
let flatMap = mapNewArr.flatMap{$0}

flatMap
mapNewArr

let arr1: [[Int]] = [[], [2], [4], [], [7]]

let flat1 = arr1.flatMap{$0}
flat1

let arr2: [Int?] = [nil, 2, 4, nil, 7]

let flat2 = arr2.flatMap{$0}
flat2


let personDictionary = ["James": 25, "Jodie": 25, "Sophie": 2]

let personArr = personDictionary.flatMap{Person(name: $0.0, age: $0.1)}

personArr