//: Playground - noun: a place where people can play

import UIKit

let numArray = [11, 23, 43, 44, 59, 43, 88, 92, 58, 11, 13, 14, 15]

let filtered = numArray.filter({$0 % 3 == 0})
print(filtered)

let reduced = numArray.reduce(Int.min, combine: { max($0, $1) })
let alsoReduced = numArray.reduce(0) {$0 > $1 ? $0: $1}
print(reduced)
print(alsoReduced)

let devmountainArray = ["I", "love", "DevMountain"]
let concatArray = devmountainArray.reduce("", combine: {$0 + " " + $1})
print(concatArray)

let bearArray = [["Mama": "Too Cold", "Papa": "Too Hot", "Baby": "Just Right"]]

//print(String((bearArray.flatMap({$0}).map({"\($0.0)'s porridge is \($0.1), "}).reduce("") {$0 + $1}).characters.dropLast().droplast()) + ".")




