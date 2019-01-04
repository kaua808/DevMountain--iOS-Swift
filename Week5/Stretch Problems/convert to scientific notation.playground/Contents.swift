//: Playground - noun: a place where people can play

import UIKit

func scientificNotation(num: Float) -> String {
    
    let numberFormatter = NSNumberFormatter()
    numberFormatter.numberStyle = NSNumberFormatterStyle.ScientificStyle
    numberFormatter.positiveFormat = "0.###E0"
    numberFormatter.exponentSymbol = "*^"
    let stringFromNumber = numberFormatter.stringFromNumber(num)
    return stringFromNumber!  // "5e+2"
    
}

scientificNotation(543)

// not using the formatter

func scientificNotation2(num: Float) -> String {
    
    var power = 0
    var remainingNum = num
    
    while remainingNum >= 10 || remainingNum <= -10 {
        remainingNum = remainingNum / 10
        power++
    }
    
    return "\(remainingNum)*10^\(power)"
}

scientificNotation2(5.28)

// or...

func scientificNotation3(num: Float) -> String {
    
    var power = 0
    var remainingNum = abs(num)
    
    while remainingNum >= -10 {
        remainingNum = remainingNum / 10
        power++
    }
    
    return "\(num/pow(10.0, Float(power)))*10^\(power)"
}

scientificNotation2(5.28)