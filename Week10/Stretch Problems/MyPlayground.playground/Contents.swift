//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let names: [String] = ["Parker", "James", "Brock", "Kaleo"]
let daysOfWeek: [Int] = [0, 1, 2, 3, 4, 5, 6]
let odds: [Bool] = [false, false, true, false]

func wentFishing() -> (name: String, day: Int, odds: Bool) {
    
    let random1 = Int(arc4random_uniform(UInt32(names.count)))
    let random2 = Int(arc4random_uniform(UInt32(daysOfWeek.count)))
    let random3 = Int(arc4random_uniform(UInt32(odds.count)))
    
    let name = names[random1]
    let dayOfWeek = daysOfWeek[random2]
    let odd = odds[random3]
    
    return (name, dayOfWeek, odd)
}

wentFishing()
wentFishing()
wentFishing()
wentFishing()
wentFishing()
wentFishing()
wentFishing()
wentFishing()
