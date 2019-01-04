//
//  Entry.swift
//  Journal 2
//
//  Created by Kaleo Kim on 2/6/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    fileprivate let titleKey = "titleKey"
    fileprivate let bodyTextKey = "bodyText"
    fileprivate let timeStampKey = "timeStampKey"
    
    let title: String
    let bodyText: String
    let timeStamp: Date
    
    init(title: String, bodyText: String, timeStamp: Date) {
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
    }
    
    
    // this is initializing it from NSUserDefaults
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[titleKey] as? String,
            let bodyText = dictionary[bodyTextKey] as? String,
            let timeStamp = dictionary[timeStampKey] as? Date else {
                
                self.title = ""
                self.bodyText = ""
                self.timeStamp = Date()
                
                return nil
        }
        
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
    }
    
    // this is to put it into NSUserDefaults
    func dictionaryCopy() -> [String: AnyObject] {
        let dictionary = [
            titleKey: self.title,
            bodyTextKey: self.bodyText,
            timeStampKey: self.timeStamp
        ] as [String : Any]
        
        return dictionary as [String : AnyObject]
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
