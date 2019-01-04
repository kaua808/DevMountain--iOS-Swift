//
//  Entry.swift
//  dateJournal
//
//  Created by Kaleo Kim on 3/11/17.
//  Copyright © 2017 Kaleo Kim. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let titleKey = "titleKey"
    private var bodyTextKey = "bodyTextKey"
    
    let title: String
    let bodyText: String
    
    init(title: String, bodyText: String) {
        self.title = title
        self.bodyText = bodyText
    }
    
    init?(dictionary: [String : AnyObject]) {
        guard let title = dictionary[titleKey] as? String,
            let bodyText = dictionary[bodyTextKey] as? String else {
                
                self.title = ""
                self.bodyTextKey = ""
                return nil
        }
        self.title = title
        self.bodyText = bodyText
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        let dictionary = [
            titleKey: self.title,
            bodyTextKey: self.bodyText
        ] as [String : Any]
        return dictionary as [String : AnyObject]
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
