//: Playground - noun: a place where people can play

import UIKit

enum EncryptionError: ErrorType {
    case empty
    case short
}

func encryptString(word: String, password: String) throws -> String {
    
    guard password.characters.count > 0 else {
        throw EncryptionError.empty
    }
    
    guard password.characters.count >= 5 else {
        throw EncryptionError.short
    }
    
//    var reverseWord: String = ""
//    
//    for character in word.characters {
//        reverseWord = String(character) + reverseWord
//    }
//    
//    return reverseWord
    
    return String(word.characters.reverse())
    
}

do {
    try encryptString("racecar", password: "nice!")
} catch EncryptionError.empty {
    print("Your Password is empty")
} catch EncryptionError.short {
    print("Your Password is too short!")
}