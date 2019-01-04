//
//  Movie.swift
//  searchController
//
//  Created by Kaleo Kim on 4/26/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Movie {
    
    private let kTitle = "title"
    private let kImage = "poster_path"
    static let kResults = "results"
    
    let title: String
    let image: String
    
    init?(json:[String:AnyObject]) {
        guard let image = json[kImage] as? String,
            let title = json[kTitle] as? String else {
                self.image = ""
                self.title = ""
                return nil
        }
        self.image = image
        self.title = title
    }
    
}