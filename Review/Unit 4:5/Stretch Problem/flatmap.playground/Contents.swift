//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let array: [AnyObject?] = [nil, 9, 4, 7]

//let map = array.map({$0 * 2})

//print(map)

//let flatmap = array.flatMap({Int($0) * 2})
let flatArray = array.flatMap { (item) -> Int? in
    if let number = item as? Int {
        return number * 2
    }
    return nil
}

print(flatArray)

//func recursiveFlatmap<T, U: AnyObject>(list: [U]) -> [T] {
//    var results = [T]()
//    results.reserveCapacity(list.count)
//    
//    for element in list {
//        if let subList = element as? [U] {
//            results += recursiveFlatmap(subList)
//        } else if let element = element as? T {
//            results.append(element)
//        }
//    }
//    
//    return results
//}
//
//print(recursiveFlatmap(array))

func newFlatMap<T, U>(array: [T], newParameters: (item: T?) -> U?) -> [U] {
    var newArray: [U] = []
    for item in array {
        if let newItem = newParameters(item: item) {
            newArray.append(newItem)
        }
    }
    return newArray
}

newFlatMap(array) { (item) -> Int? in
    if let number = item as? Int {
        return number * 2
    }
    return nil
}


