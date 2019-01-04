//
//  Entry.swift
//  Journal3
//
//  Created by Kaleo Kim on 2/7/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let titleKey = "titleKey"
    private let bodyTextKey = "bodyTextKey"
    private let timeStampKey = "timeStampKey"
    
    let title: String
    let bodyText: String
    let timeStamp: NSDate
    
    init(title: String, bodyText: String, timeStamp: NSDate) {
        
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
        
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[titleKey] as? String,
            let bodyText = dictionary[bodyTextKey] as? String,
            let timeStamp = dictionary[timeStampKey] as? NSDate else {
                
                self.title = ""
                self.bodyText = ""
                self.timeStamp = NSDate()
                
                return nil
                
        }
        
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
        
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        
        let dicitonary = [
            titleKey: self.title,
            bodyTextKey: self.bodyText,
            timeStampKey: self.timeStamp
        ]
        
        return dicitonary
    }
    
}

func ==(rhs: Entry, lhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}