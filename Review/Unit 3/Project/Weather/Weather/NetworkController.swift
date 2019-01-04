//
//  NetworkController.swift
//  Weather
//
//  Created by Kaleo Kim on 4/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func dataAtURL(url: String, completion:(success: Bool, data: NSData?) -> Void) {

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
    
    static func serializeDataWithReturn(data: NSData) -> [String: AnyObject]? {
        
        return (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
        
    }
//    static func serializeData(data: NSData, completion: (json: [String: AnyObject]?) -> Void) {
//        
//        let json = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
//        completion(json: json)
//        
//    }
}





























//static func dataAtURL(url: String, completion: (success: Bool, data: NSData?) -> Void) {
//    
//    guard let url = NSURL(string: url) else {
//        completion(success: false, data: nil)
//        return
//    }
//    
//    let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) in
//        
//        if let error = error {
//            
//            print(error.localizedDescription)
//            completion(success: false, data: nil)
//        } else {
//            completion(success: true, data: data)
//        }
//    }
//    task.resume()
//}


//static func serializeDataWithReturn(data: NSData) -> [String: AnyObject]? {
//    return (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
//    
//}