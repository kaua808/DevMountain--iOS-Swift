//
//  NetworkController.swift
//  DeckOfCardApi
//
//  Created by Kaleo Kim on 2/17/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation
import UIKit

class NetworkcController {
    
    static func dataAtURL(/*url: NSURL,*/ completion: (returnedData: NSData?) -> Void ) {
        
        let url = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/?count=1")!
        
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) -> Void in
            
            if let error = error {
                print("Error with dataTask: \(error)")
            }
            completion(returnedData: data)
        }
        dataTask.resume()
    }
    
    
    static func fetchImageAtURL(imageURLString: String, completion:(image: UIImage?) -> Void ) {
        
        if let url = NSURL(string: imageURLString) {
            NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, _, error) -> Void in
                if let error = error {
                    print(error.localizedDescription)
                    completion(image: nil)
                }
                
                if let data = data {
                    let image = UIImage(data: data)
                    completion(image: image)
                }
            })
            .resume()
        } else {
            completion(image: nil)
        }
        
    }
    
}




























