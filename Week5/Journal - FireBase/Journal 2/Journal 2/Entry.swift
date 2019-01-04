//
//  Entry.swift
//  Journal 2
//
//  Created by Kaleo Kim on 2/6/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let titleKey = "title"
    private let textKey = "text"
    private let timeStampKey = "timeStamp"
    
    let title: String
    let text: String
    let timeStamp: NSDate
    
    init(title: String, text: String, timeStamp: NSDate = NSDate()) {
        self.title = title
        self.text = text
        self.timeStamp = timeStamp
    }
    
    
    // this is initializing it from NSUserDefaults
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[titleKey] as? String,
            let text = dictionary[textKey] as? String
            /*let timeStamp = dictionary[timeStampKey] as? NSDate*/ else {
                
                self.title = ""
                self.text = ""
                self.timeStamp = NSDate()
                
                return nil
        }
        
        self.title = title
        self.text = text
        self.timeStamp = NSDate()
    }
    
    // this is to put it into NSUserDefaults
    func dictionaryCopy() -> [String: AnyObject] {
        let dictionary = [
            titleKey: self.title,
            textKey: self.text,
            //timeStampKey: self.timeStamp
        ]
        
        return dictionary
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}