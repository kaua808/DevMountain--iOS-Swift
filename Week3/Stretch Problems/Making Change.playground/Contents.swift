//: Playground - noun: a place where people can play

import UIKit



func makeChange(money: Double) -> String {
    let amountInCents = Int(money * 100)
    let dollars = amountInCents / 100
    let quarters = (amountInCents - (dollars * 100)) / 25
    let dimes = (amountInCents - quarters * 25 - dollars * 100) / 10
    let nickels = (amountInCents - dollars * 100 - quarters * 25 - dimes * 10) / 5
    let pennies = (amountInCents % 5)
    
    let dollarString = dollars == 1 ? "1 dollar":"\(dollars) dollars"
    let quarterString = quarters == 1 ? "1 quarter":"\(quarters) quarters"
    let dimeString = dimes == 1 ? "1 dime":"\(dimes) dimes"
    let nickelString = nickels == 1 ? "1 nickel":"\(nickels) nickels"
    let pennyString = pennies == 1 ? "1 penny":"\(pennies) pennies"
    let amountString = "Your change is \(dollarString), \(quarterString), \(dimeString), \(nickelString), and \(pennyString)"
    
    return amountString
}
makeChange(2.54)


func changeAmount(totalPrice: Double, amountGiven: Double) -> String {
    
    let changeDue = amountGiven - totalPrice
    
    return makeChange(changeDue)
}

changeAmount(2.15, amountGiven: 5.00)
