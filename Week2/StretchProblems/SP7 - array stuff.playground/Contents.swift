//: Playground - noun: a place where people can play

import UIKit

let numArray = [14, 26, 74, 46, 78, 83, 345, 36, 1, 65]

//

//part 1
//func myFunc(array: Array<Int>) {
//    for num in array {
//        if num < 50 {
//            print("low")
//        } else {
//            print("hi")
//        }
//    }
//}
//
//myFunc(numArray)

//part 2
func myFunc(array: Array<Int>) {
    for num in array {
        if num % 13 == 0 {
            print("didn't learn that in school")
        } else {
            print("to easy")
        }
    }
}

myFunc(numArray)

//func myFunc(array: Array<Int>) {
//    var placeHolderNum = 0
//    for num in array {
//        if num > placeHolderNum {
//            print("got bigger")
//            placeHolderNum = num
//        } else {
//            print("got smaller")
//            placeHolderNum = num
//        }
//        
//    }
//}
//
//myFunc(numArray)


// Ternary Style

func biggerOrSmaller(array: Array<Int>) {
    var placeHolderNum = 0
    for num in array {
        num > placeHolderNum ?  print("got bigger") : print("got smaller")
        placeHolderNum = num
    }
}

//biggerOrSmaller(numArray)


// Second highest value
func secondHighestValue(array: Array<Int>) {
    let newArray = array.sort {
        $0 < $1
    }
    print(newArray[newArray.count - 2])
}

//secondHighestValue(numArray)



let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = defaultColorName ?? userDefinedColorName

var optionalInt: Int?

print(optionalInt ?? 5)

//black diamond







