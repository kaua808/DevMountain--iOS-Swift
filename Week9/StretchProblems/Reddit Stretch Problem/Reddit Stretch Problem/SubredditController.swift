//
//  SubredditController.swift
//  Reddit Stretch Problem
//
//  Created by Kaleo Kim on 3/28/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class SubredditController {
    
    static func subredditBySearchTerm(term: String, completion:(result: Subreddit?) -> Void) {
        
        let url = NetworkController.searchSubreddit(term)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            
            guard let resultData = resultData
                else {
                    print("NO DATA RETURNED")
                    completion(result: nil)
                    return
            }
            
            do {
                let redditObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.AllowFragments)
                
                var subredditModelObject: Subreddit?
                
                if let subredditDictionary = redditObject as? [String : AnyObject] {
                    subredditModelObject = Subreddit(jsonDictionary: subredditDictionary)
                }
                
                completion(result: subredditModelObject)
                
            } catch {
                completion(result: nil)
            }
            
        }
    }
    
}