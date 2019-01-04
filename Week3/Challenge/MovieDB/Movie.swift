//
//  Movie.swift
//  MovieDB
//
//  Created by Kaleo Kim on 2/18/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

struct Movie {
    
    private let kID = "id"
    private let kTitle = "original_title"
    private let kOverview = "overview"
    private let kVoteAverage = "vote_average"
    
    var id: Int
    var title: String = ""
    var overview: String = ""
    var voteAverage: Float = 0
    
    init?(jsonDictionary: [String: AnyObject]) {
        
        guard let id = jsonDictionary[kID] as? Int else {
            return nil
        }
        self.id = id
        self.title = jsonDictionary[kTitle] as? String ?? ""
        self.overview = jsonDictionary[kOverview] as? String ?? ""
        self.voteAverage = jsonDictionary[kVoteAverage] as? Float ?? 0.0
        
    }
    
    
    
    
}