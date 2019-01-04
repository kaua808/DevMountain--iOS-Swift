//
//  Movie.swift
//  Movie Search Collection View
//
//  Created by Kaleo Kim on 2/24/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Movie {
    
    let title: String
    let rating: Float
    let summary: String
    
    init?(json:[String:AnyObject]) {
        guard let title = json["title"] as? String,
            let rating = json["vote_average"] as? Float,
            let summary = json["overview"] as? String where !summary.isEmpty else {
                self.title = ""
                self.summary = ""
                self.rating = 0
                return nil
        }
        self.title = title
        self.summary = summary
        self.rating = rating
    }
}