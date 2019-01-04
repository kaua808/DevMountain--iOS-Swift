//
//  Entry.swift
//  Timeline
//
//  Created by Kaleo Kim on 3/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let titleKey = "title"
    private let bodyKey = "body"
    
    let title: String
    let body: String
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let title = dictionary[titleKey] as? String,
            let body = dictionary[bodyKey] as? String else {
                self.title = ""
                self.body = ""
                
                return nil
        }
        
        self.title = title
        self.body = body
        
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        
        let dictionary = [
            titleKey: self.title,
            bodyKey: self.body
        ]
        
        return dictionary
    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}