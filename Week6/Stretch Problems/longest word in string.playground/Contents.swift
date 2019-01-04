//: Playground - noun: a place where people can play

import UIKit


func longWord(var sentence: String) -> String {
    
    sentence += " "
    
    var word = ""
    var length = 0
    
    var max = 0
    var longestWord = ""
    
    print(sentence.characters)
    
    for character in sentence.characters {
        if character == " " {
            if length > max {
                max = length
                longestWord = word
            }
            word = ""
            length = 0
        } else {
            word += "\(character)"
            length++
        }
    }
    
    return longestWord
 
}

longWord("this string, has a gigantic! word in it")

extension String {
    var words: [String] {
        return componentsSeparatedByCharactersInSet(.punctuationCharacterSet()).joinWithSeparator("").componentsSeparatedByString(" ").filter{!$0.isEmpty}
    }
}

func longestWord(sentence: String) -> String {
  
    // one way
//    let wordArray = word.characters.split{$0 == " "}.map(String.init)
    
    // second ways
//    let newWordArray = word.componentsSeparatedByString(" ")
//    print(newWordArray)
    
    //print(wordArray)
    
    var longestWord = "" 
    for word in sentence.words {
        if word.characters.count > longestWord.characters.count {
            longestWord = word
        }
    }
    
    return longestWord
}

longestWord("this string, has a gigantic! word in it")












