//: Playground - noun: a place where people can play

import UIKit


//fail
func divideThree(num: Int) -> [Int] {
    
    var ph = num
    var numArray = [ph]
    
    if ph == 1 {
        return numArray
    } else {
        if num % 3 == 0 {
            ph = num % 3
            numArray.append(ph)
            print(ph)
        }
    }
    
    
    return numArray
}

divideThree(99)

//close
func printThrees(var input : Int) -> [Int]{
    
    var numArray: [Int] = [input]
    
    while input > 1 {
        if (input + 1) % 3 == 0 {
            print("\(input) 1")
            ++input
            numArray.append(input)
        } else if (input - 1) % 3 == 0 {
            print("\(input) -1")
            --input
            //numArray.append(input)
        } else {
            input /= 3
            if input % 3 == 0 {
                print("\(input) 0")
                numArray.append(input)
            }
        }
    }
    print(input)
    return numArray
}

printThrees(100)

// got it

func game(num: Int) -> [Int] {
 
    var numArray: [Int] = []
    var newNum: Int = num
    
    while newNum > 1 {
        if newNum % 3 == 0 {
            numArray.append(newNum)
            newNum = newNum / 3
        } else if (newNum + 1) % 3 == 0 {
            numArray.append(newNum)
            newNum = (newNum + 1) / 3
        } else {
            numArray.append(newNum)
            newNum = (newNum - 1) / 3
        }
    }
    numArray.append(newNum)
    return numArray
}

game(100)






