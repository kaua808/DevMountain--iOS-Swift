//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
struct MyCustomStruct {
    var someSortableField: String
}

var customArray = [
    MyCustomStruct(someSortableField: "Jemima"),
    MyCustomStruct(someSortableField: "Peter"),
    MyCustomStruct(someSortableField: "David"),
    MyCustomStruct(someSortableField: "Kelly"),
    MyCustomStruct(someSortableField: "Isabella")
]

let sortedArray = customArray.sort { (element1, element2) -> Bool in
    return element1.someSortableField < element2.someSortableField
}