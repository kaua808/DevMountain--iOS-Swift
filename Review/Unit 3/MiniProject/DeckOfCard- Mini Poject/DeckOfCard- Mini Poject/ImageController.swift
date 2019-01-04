//
//  ImageController.swift
//  DeckOfCard- Mini Poject
//
//  Created by Kaleo Kim on 4/18/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func imageForURL(url: String, completion: (image: UIImage?) -> Void) {
        
        NetworkController.dataAtURL(url) { (success, data) in
            
            guard let data = data where success else {
                
                completion(image: nil)
                return
                
            }
            
            let image = UIImage(data: data)
            completion(image: image)
            
        }
        
    }
    
}