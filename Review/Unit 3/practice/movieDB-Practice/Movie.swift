//
//  Movie.swift
//  movieDB-Practice
//
//  Created by Kaleo Kim on 4/22/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Movie {
    
    private let kTitle = "title"
    private let kRating = "vote_average"
    private let kOverView = "overview"
    
    let title: String
    let rating: Float
    let summary: String
    
    init?(json:[String:AnyObject]) {
        guard let title = json[kTitle] as? String,
            let rating = json[kRating] as? Float,
            let summary = json[kOverView] as? String where !summary.isEmpty else {
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