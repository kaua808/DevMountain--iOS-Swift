//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let date = NSDate() // now
let cal = NSCalendar.currentCalendar()

// Swift 2:
let day = cal.ordinalityOfUnit(.Day, inUnit: .Year, forDate: date)

print(day)

let firstDayOfTheYear  = NSCalendar.currentCalendar().dateWithEra(1, year: NSCalendar.currentCalendar().component(.Year, fromDate: NSDate()), month: 12, day: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)!

let lastDayOfTheYear  = NSCalendar.currentCalendar().dateWithEra(1, year: NSCalendar.currentCalendar().component(.Year, fromDate: NSDate()), month: 12, day: 31, hour: 12, minute: 0, second: 0, nanosecond: 0)!


func timeIntervalForYear(year: Int) -> (start: NSTimeInterval, end: NSTimeInterval) {
    
    var firstDayOfTheYear = NSDate()
    var lastDayOfTheYear = NSDate()
    
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy"
    
    if let formattedYear = formatter.dateFromString(String(year)) {
        firstDayOfTheYear = NSCalendar.currentCalendar().dateWithEra(1, year: NSCalendar.currentCalendar().component(.Year, fromDate: formattedYear), month: 1, day: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)!
        
        lastDayOfTheYear = NSCalendar.currentCalendar().dateWithEra(1, year: NSCalendar.currentCalendar().component(.Year, fromDate: formattedYear), month: 12, day: 31, hour: 23, minute: 59, second: 59, nanosecond: 0)!
    }
    
    return (firstDayOfTheYear.timeIntervalSince1970, lastDayOfTheYear.timeIntervalSince1970)
    
}

timeIntervalForYear(2014)