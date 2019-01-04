//
//  ImageController.swift
//  DeckOfCards
//
//  Created by James Pacheco on 12/8/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

import UIKit

class ImageController {
    
    static func imageForURL(url: NSURL, completion: (image: UIImage?) -> Void) {
        dispatch_async(dispatch_queue_create("", nil)) {
            let data = NSData(contentsOfURL: url)
            if let data = data {
                let image = UIImage(data: data)
                dispatch_async(dispatch_get_main_queue(), {
                    completion(image: image)
                })
            } else {
                print("No data in the imageURL")
                dispatch_async(dispatch_get_main_queue(), {
                    completion(image: nil)
                })
            }
        }
    }
    
}