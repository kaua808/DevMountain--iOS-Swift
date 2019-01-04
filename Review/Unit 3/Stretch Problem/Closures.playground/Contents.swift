//: Playground - noun: a place where people can play

import UIKit

let numArray = [11, 23, 43, 44, 59, 43, 88, 92, 58 ,11, 13, 14, 15]

let filteredArray = numArray.filter{$0 % 3 == 0}

print(filteredArray)

let maxReduce = numArray.reduce(0, combine: { max($0, $1) })

print(maxReduce)

let stringArr = ["I", "love", "Dev Mountain"]

let reducedString = stringArr.reduce("", combine: { $0 == "" ? $1 : $0 + " " + $1 })

print(reducedString)

let bearArray = [["Mama": "Too Cold", "Papa": "Too Hot", "Baby": "Just Right"]]

let combinedBearAray = String((bearArray.flatMap({$0}).map({"\($0.0)'s porridge is \($0.1), "}).reduce("") {$0 + $1}))

print(combinedBearAray)

//print(String((bearArray.flatMap({$0}).map({"\($0.0)'s porridge is \($0.1), "}).reduce("") {$0 + $1}).characters.dropLast().droplast()) + ".")