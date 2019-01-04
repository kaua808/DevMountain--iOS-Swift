//
//  WordController.swift
//  FuzzySearch2
//
//  Created by James Pacheco on 3/30/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation


class WordController {
    
    static var words: [Word] = []
    
    static func createWordList() {
        
        let filePath = "/Users/James/Documents/Development/iOS Development/DevMountain/Miscellaneous/FuzzySearch2/FuzzySearch2/dictionary.json"
        
        guard let data = NSData(contentsOfFile: filePath) else {return}
        guard let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) else {return}
        if let jsonDictionary = json as? [String: String] {
            var words: [Word] = []
            for (word, definition) in jsonDictionary {
                let word = Word(word: word, definition: definition)
                words.append(word)
            }
            WordController.words = words.sort{$0.word < $1.word}
        }
    }
}