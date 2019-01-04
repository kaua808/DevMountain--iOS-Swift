//
//  NetworkController.swift
//  iTunesSearch
//
//  Created by Kaleo Kim on 2/17/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func fetchJSONAtURL(url: NSURL, completion:(json: [String:AnyObject]?) -> Void) {
        
        // get instance of a session
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            
            let jsonData = try? NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String: AnyObject]
            
            completion(json: jsonData!)
            
        }
        
        task.resume()
        
    }
    

    
    
}