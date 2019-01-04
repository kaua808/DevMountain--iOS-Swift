//: Playground - noun: a place where people can play

import UIKit

//func clockPrint(num: Int) {
//    
//    
//    
//    print(one)
//}
//
//clockPrint(3)

func printNumber(number: Int) {
    let newArray = String(number).characters
    var lineOne = ""
    var lineTwo = ""
    var lineThree = ""
    var lineFour = ""
    var lineFive = ""
    var lineSix = ""
    var lineSeven = ""
    print("\(newArray)")
    for int in newArray {
        switch int {
        case "0":
            lineOne = lineOne + " " + horizontal()
            lineTwo = lineTwo + " " + bothSides()
            lineThree = lineThree + " " + bothSides()
            lineFour = lineFour + " " + bothSides()
            lineFive = lineFive + " " + bothSides()
            lineSix = lineSix + " " + bothSides()
            lineSeven = lineSeven + " " + horizontal()
        case "1":
            lineOne = lineOne + " " + emptyHorizontal()
            lineTwo = lineTwo + " " + rightSide()
            lineThree = lineThree + " " + rightSide()
            lineFour = lineFour + " " + rightHorizontal()
            lineFive = lineFive + " " + rightSide()
            lineSix = lineSix + " " + rightSide()
            lineSeven = lineSeven + " " + emptyHorizontal()
        case "2":
            lineOne = lineOne + " " + horizontal()
            lineTwo = lineTwo + " " + rightSide()
            lineThree = lineThree + " " + rightSide()
            lineFour = lineFour + " " + horizontal()
            lineFive = lineFive + " " + leftSide()
            lineSix = lineSix + " " + leftSide()
            lineSeven = lineSeven + " " + horizontal()
        case "3":
            lineOne = lineOne + " " + horizontal()
            lineTwo = lineTwo + " " + rightSide()
            lineThree = lineThree + " " + rightSide()
            lineFour = lineFour + " " + horizontal()
            lineFive = lineFive + " " + rightSide()
            lineSix = lineSix + " " + rightSide()
            lineSeven = lineSeven + " " + horizontal()
        case "4":
            lineOne = lineOne + " " + emptyHorizontal()
            lineTwo = lineTwo + " " + bothSides()
            lineThree = lineThree + " " + bothSides()
            lineFour = lineFour + " " + horizontal()
            lineFive = lineFive + " " + rightSide()
            lineSix = lineSix + " " + rightSide()
            lineSeven = lineSeven + " " + rightSide()
        case "5":
            lineOne = lineOne + " " + horizontal()
            lineTwo = lineTwo + " " + leftSide()
            lineThree = lineThree + " " + leftSide()
            lineFour = lineFour + " " + horizontal()
            lineFive = lineFive + " " + rightSide()
            lineSix = lineSix + " " + rightSide()
            lineSeven = lineSeven + " " + horizontal()
        case "6":
            lineOne = lineOne + " " + horizontal()
            lineTwo = lineTwo + " " + leftSide()
            lineThree = lineThree + " " + leftSide()
            lineFour = lineFour + " " + horizontal()
            lineFive = lineFive + " " + bothSides()
            lineSix = lineSix + " " + bothSides()
            lineSeven = lineSeven + " " + horizontal()
        case "7":
            lineOne = lineOne + " " + horizontal()
            lineTwo = lineTwo + " " + rightSide()
            lineThree = lineThree + " " + rightSide()
            lineFour = lineFour + " " + rightSide()
            lineFive = lineFive + " " + rightSide()
            lineSix = lineSix + " " + rightSide()
            lineSeven = lineSeven + " " + rightSide()
        case "8":
            lineOne = lineOne + " " + horizontal()
            lineTwo = lineTwo + " " + bothSides()
            lineThree = lineThree + " " + bothSides()
            lineFour = lineFour + " " + horizontal()
            lineFive = lineFive + " " + bothSides()
            lineSix = lineSix + " " + bothSides()
            lineSeven = lineSeven + " " + horizontal()
        case "9":
            lineOne = lineOne + " " + horizontal()
            lineTwo = lineTwo + " " + bothSides()
            lineThree = lineThree + " " + bothSides()
            lineFour = lineFour + " " + horizontal()
            lineFive = lineFive + " " + rightSide()
            lineSix = lineSix + " " + rightSide()
            lineSeven = lineSeven + " " + rightSide()
        default:
            break
        }
    }
    print(lineOne)
    print(lineTwo)
    print(lineThree)
    print(lineFour)
    print(lineFive)
    print(lineSix)
    print(lineSeven)
}
func horizontal() -> String {
    return(" ---- ")
}
func rightHorizontal()-> String {
    return("     |")
}
func emptyHorizontal()-> String {
    return("      ")
}
func leftSide()-> String {
    return("|     ")
}
func rightSide()-> String {
    return("     |")
}
func bothSides()-> String {
    return("|    |")
}
printNumber(1234567890)
printNumber(9457)
