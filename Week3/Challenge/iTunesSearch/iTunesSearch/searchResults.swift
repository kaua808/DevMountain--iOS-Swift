//
//  searchResults.swift
//  iTunesSearch
//
//  Created by Kaleo Kim on 2/17/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

struct SearchResults {
    
    private let titleKey = "trackName"
    private let categoryKey = "primaryGenreName"
    private let artistKey = "artistname"
    
    let title: String
    let category: String
    let artist: String
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let title = dictionary[titleKey] as? String,
            let category = dictionary[categoryKey] as? String,
            let artist = dictionary[artistKey] as? String else {
                return nil
        }
        self.title = title
        self.category = category
        self.artist = artist
   
    }
    
}