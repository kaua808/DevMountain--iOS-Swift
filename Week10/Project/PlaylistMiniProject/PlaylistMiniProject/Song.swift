//
//  Song.swift
//  PlaylistMiniProject
//
//  Created by Parker Donat on 4/6/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class Song {
    
    let kName = "name"
    let kArtist = "artist"
    
    let name: String
    let artist: String
    
    var dictionaryCopy: [String: AnyObject] {
        return [kName: name, kArtist: artist]
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String,
            let artist = dictionary[kArtist] as? String else {return nil}
        
        self.name = name
        self.artist = artist
    }

    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
    
    
}