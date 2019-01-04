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

func palindromef(word: String) -> Bool {
    
    var reversedWord = ""
    for character in word.characters {
        if !NSCharacterSet.punctuationCharacterSet().characterIsMember() {
        reversedWord = String(character) + reversedWord
            nonReversedWord = reversWord + String(character)
        
    }
    
}


