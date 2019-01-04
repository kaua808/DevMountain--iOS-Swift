//
//  ImageController.swift
//  Weather
//
//  Created by Kaleo Kim on 4/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func imageAtURL(url: String, completion: (image: UIImage?) -> Void) {
        
        NetworkController.dataAtURL(url) { (success, data) in
            guard let data = data else {completion(image: nil); return}
            
            let image = UIImage(data: data)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(image: image)
            })
            
        }
        
    }
    
}