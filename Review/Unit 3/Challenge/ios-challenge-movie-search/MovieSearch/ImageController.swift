//
//  ImageController.swift
//  MovieSearch
//
//  Created by Kaleo Kim on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func imageAtURL(movie: Movie, completion: (image: UIImage?) -> Void) {
        
        let url = "http://image.tmdb.org/t/p/w500/\(movie.image)"
        
        NetworkController.dataAtURL(url) { (success, data) in
            guard let data = data else {completion(image: nil); return}
            
            let image = UIImage(data: data)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(image: image)
            })
            
        }
        
    }
    
}