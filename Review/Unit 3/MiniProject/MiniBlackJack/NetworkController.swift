//
//  NetworkController.swift
//  MiniBlackJack
//
//  Created by Kaleo Kim on 4/19/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func dataAtURL(url: String, completion: (success: Bool, data: NSData?) -> Void) {
        
        guard let url = NSURL(string: url) else {
            completion(success: false, data: nil)
            return
        }
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                completion(success: false, data: nil)
            } else {
                completion(success: true, data: data)
            }
        }
        task.resume()
    }
    
//    static func serializeData(data: NSData) -> [String: AnyObject]? {
//        return (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
//        
//    }
    
    static func serializeData(data: NSData, completion: (json: [String: AnyObject]?) -> Void) {
        
        let json = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
        completion(json: json)
        
    }
    
}