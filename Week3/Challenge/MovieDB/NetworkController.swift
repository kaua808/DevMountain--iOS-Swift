//
//  NetworkController.swift
//  MovieDB
//
//  Created by Kaleo Kim on 2/18/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation


class NetworkController {
    
    static func dataAtURL(url: NSURL, completion: (data: NSData?) -> Void) {
        
       let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            if error != nil {
                // Error exists
                print("Error in \(__FUNCTION__) - \(error!.localizedDescription)")
                completion(data: nil)
            } else {
                
                completion(data: data)
                
            }
        }
        dataTask.resume()
    }
}