//
//  Subreddit.swift
//  Reddit Stretch Problem
//
//  Created by Kaleo Kim on 3/28/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

//class Subreddit {
//    
//    static let kTitle = "title"
//    static let kChildren = "children"
//    static let kData = "data"
//    static let kURL = "url"
//    
//    
//    var title: String
//    var url: String
//    
//    init?(jsonDictionary: [String: AnyObject]) {
//     
//        guard let data = jsonDictionary[kData] as? [String: AnyObject] {
//            
//        }
//        
//    }
//}

class Subreddit {
    
    static let kTitle = "title"
    static let kChildren = "children"
    static let kData = "data"
    static let kURL = "url"
    
    
    var title: String
    var url: String
    var children: [String: AnyObject]
    
    init?(jsonDictionary: [String: AnyObject]) {
        
        guard let data = jsonDictionary[kData] as? [String: AnyObject] {
            
        }
        
    }
}
