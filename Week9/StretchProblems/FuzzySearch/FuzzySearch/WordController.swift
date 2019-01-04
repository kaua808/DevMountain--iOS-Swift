//
//  DictionaryController.swift
//  FuzzySearch
//
//  Created by Kaleo Kim on 3/30/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class WordController {
    
    static var words: [Word] = []
    
    static func createWordList() {
        
        let filePath = "/Users/kaleo/Documents/DevMountain/iOS - Swift/Week9/StretchProblems/FuzzySearch/FuzzySearch/dictionary.json"
        guard let data = NSData(contentsOfFile: filePath) else { return }
        if let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: String] {
            
            
            var words: [Word] = []
            for (word, definition) in jsonDictionary {
                let word = Word(word: word, definition: definition)
                words.append(word)
            }
            WordController.words = words.sort{$0.word < $1.word}
        }
    }
    
    
}