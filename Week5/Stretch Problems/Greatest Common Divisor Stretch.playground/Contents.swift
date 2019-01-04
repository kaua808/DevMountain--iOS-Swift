//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func gcd(a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        if a > b {
            return gcd(a-b, b)
        } else {
            return gcd(b-a, a)
        }
    }
}

gcd(150, 250)