//
//  NetworkController.swift
//  Movie Search Collection View
//
//  Created by Kaleo Kim on 2/24/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func baseURL(searchTerm:String) -> NSURL {
        let modifiedSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+")
        return NSURL(string: "http://api.themoviedb.org/3/search/movie?query=\(modifiedSearchTerm)&api_key=68a8779098e355ac704c413416c684af")!
    }
    
    static func popularURL() -> NSURL {
        return NSURL(string: "http://api.themoviedb.org/3/movie/popular?api_key=68a8779098e355ac704c413416c684af")!
    }
    
    static func dataAtURL(url:NSURL, completion:(resultData:NSData?) -> Void){
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
            completion(resultData: data)
        }
        dataTask.resume()
    }
    
    
    
}
