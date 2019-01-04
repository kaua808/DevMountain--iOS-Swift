//
//  NetworkController.swift
//  Reddit Stretch Problem
//
//  Created by Kaleo Kim on 3/28/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class NetworkController {
    
    static let base = "https://www.reddit.com/r/"
    
    static func searchSubreddit(term: String) -> NSURL {
        
        //let escapedTerm = term.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())
        
        return NSURL(string: base + "\(term).json")!
        
    }
    
    static func dataAtURL(url: NSURL, completion: (resultsData: NSData?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) in
            
            guard let data = data else {
                print(error?.localizedDescription)
                completion(resultsData: nil)
                return
            }
            completion(resultsData: data)
            
        }
        dataTask.resume()
    }

}