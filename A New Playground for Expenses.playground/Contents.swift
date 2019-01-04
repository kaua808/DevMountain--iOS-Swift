//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public func <(a: NSDate, b: NSDate) -> Bool {
    return a.compare(b) == NSComparisonResult.OrderedAscending
}

public func ==(a: NSDate, b: NSDate) -> Bool {
    return a.compare(b) == NSComparisonResult.OrderedSame
}

extension NSDate: Comparable { }

extension NSDate {
    
    func startOfMonth() -> NSDate? {
        
        let calendar = NSCalendar.currentCalendar()
        let currentDateComponents = calendar.components([.Year, .Month], fromDate: self)
        let startOfMonth = calendar.dateFromComponents(currentDateComponents)
        
        return startOfMonth
    }
    
    func dateByAddingMonths(monthsToAdd: Int) -> NSDate? {
        
        let calendar = NSCalendar.currentCalendar()
        let months = NSDateComponents()
        months.month = monthsToAdd
        
        return calendar.dateByAddingComponents(months, toDate: self, options: .MatchFirst)
    }
    
    func endOfMonth() -> NSDate? {
        
        let calendar = NSCalendar.currentCalendar()
        if let plusOneMonthDate = dateByAddingMonths(1) {
            let plusOneMonthDateComponents = calendar.components([.Year, .Month], fromDate: plusOneMonthDate)
            
            let endOfMonth = calendar.dateFromComponents(plusOneMonthDateComponents)?.dateByAddingTimeInterval(-1)
            
            return endOfMonth
        }
        
        return nil
    }
}


typealias MonthName = String
typealias CategoryName = String
typealias CategorizedExpenses = [CategoryName: [Expense]]
typealias CategorizedExpenseList = [MonthName: CategorizedExpenses]

struct Expense {
    
    let category: String
    let date: NSDate
}

// array of expenses

let expense1 = Expense(category: "Food", date: NSDate())
let expense2 = Expense(category: "Rent", date: NSDate(timeIntervalSinceNow: -60*60*24*7))
let expense3 = Expense(category: "Rent", date: NSDate(timeIntervalSinceNow: -60*60*24*7))
let expense4 = Expense(category: "Clothing", date: NSDate(timeIntervalSinceNow: -60*60*24*37))

let expenses = [expense1, expense2, expense3, expense4]

// group by category by month from year

let year = 2016

func expensesGroupedByCategoryAndDate(expenses: [Expense]) -> CategorizedExpenseList? {
    
    // filter by category
    
    let categories = Set(expenses.map({ $0.category }))
    
    print(categories)
    
    var categoryDictionary: CategorizedExpenseList = [:]
    
    // get the expenses for that category
    // limit expenses by month
    // month start date
    // month end date
    // filter expenses for those between start and end dates
    // return in [MonthName: [Expense]] format
    
    for category in categories {
        
        let categoryExpenses = expenses.filter({ $0.category == category })
        
        for monthIndex in 1...12 {
            
            let monthName = NSCalendar.currentCalendar().monthSymbols[monthIndex-1]
            
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy"
            
            if let currentYear = formatter.dateFromString(String(year)),
                let dateInMonth = NSCalendar.currentCalendar().dateWithEra(1, year: NSCalendar.currentCalendar().component(.Year, fromDate: currentYear), month: monthIndex, day: 1, hour: 0, minute: 0, second: 0, nanosecond: 0),
                let monthStart = dateInMonth.startOfMonth(),
                let monthEnd = dateInMonth.endOfMonth()
            {
                
                let expensesForMonthInCategory = categoryExpenses.filter({ monthStart < $0.date && $0.date < monthEnd })
                
                let categorizedExpenses = [category: expensesForMonthInCategory] as CategorizedExpenses
                
                
                if let existingExpenseList = categoryDictionary[monthName] {
                
                    print("there were existing expenses: \(existingExpenseList)")
                    
                    if let existingExpenses = existingExpenseList[category],
                        let newExpenses = categorizedExpenses[category] {
                        
                        let allExpenses = existingExpenses + newExpenses
                        
                        if !allExpenses.isEmpty {
                            let newValue = [category: allExpenses]
                            
                            categoryDictionary.updateValue(newValue, forKey: monthName)
                        }
                    }
                } else {
                    
                    if !categorizedExpenses.isEmpty {
                        categoryDictionary.updateValue(categorizedExpenses, forKey: monthName)
                    }
                }
            }
        }
    }
    
    print(categoryDictionary)
    
    return nil
}

expensesGroupedByCategoryAndDate(expenses)


func startAndEndOfMonth(month: Int, year: Int) -> (start: NSDate?, end: NSDate?)? {
    
    let formatter = NSDateFormatter()
    formatter.dateFormat = "mm-yyyy"
    
    let dateString = "\(month)-\(year)"
    
    guard let date = formatter.dateFromString(dateString) else { return nil }
    
    let startDate = date.startOfMonth()
    let endDate = date.endOfMonth()
    
    return (startDate, endDate)
}

