//: Playground - noun: a place where people can play

import UIKit

func palindrome(string: String) -> Bool {
    
    let trimmedString = string.stringByReplacingOccurrencesOfString(" ", withString: "")
    
    let reversed = String(trimmedString.characters.reverse())
    
    if trimmedString.lowercaseString == reversed.lowercaseString {
        return true
    } else {
        return false
    }
    
}


palindrome("race car")

func palindromeArray(arr: [String]) -> Bool {
    
    let trimmedArr = arr.map({$0.stringByReplacingOccurrencesOfString(" ", withString: "")})
    
    let reversedArr = trimmedArr.map({String($0.characters.reverse())})

        return true
}

palindromeArray(["race car", "life is good", "step on no pets"])

