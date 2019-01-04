//
//  Movie.swift
//  MovieSearch
//
//  Created by Kaleo Kim on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Movie {
    
    private let kTitle = "title"
    private let kRating = "vote_average"
    private let kOverView = "overview"
    private let kImage = "poster_path"
    static let kResults = "results"
    
    let title: String
    let rating: Float
    let summary: String
    let image: String
    
    init?(json:[String:AnyObject]) {
        guard let image = json[kImage] as? String,
            let title = json[kTitle] as? String,
            let rating = json[kRating] as? Float,
            let summary = json[kOverView] as? String where !summary.isEmpty else {
                self.image = ""
                self.title = ""
                self.summary = ""
                self.rating = 0
                return nil
        }
        self.image = image
        self.title = title
        self.summary = summary
        self.rating = rating
    }
    
}