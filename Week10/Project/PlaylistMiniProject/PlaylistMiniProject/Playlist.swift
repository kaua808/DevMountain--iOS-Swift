//
//  Playlist.swift
//  PlaylistMiniProject
//
//  Created by Parker Donat on 4/6/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class Playlist {
    
    let kName = "name"
    let kSong = "song"
    
    let name: String
    var songs: [Song]
    
    var dictionaryCopy: [String: AnyObject] {
        
        var songDictionaries: [[String: AnyObject]] = []
        for song in songs {
            songDictionaries.append(song.dictionaryCopy)
        }
        return [kName: name, kSong: songDictionaries]
        
        // Or you can just do the line below.  the above kinda shows what the below is doing
        
        //return ["name": name, "songs": songs.map{$0.dictionaryCopy}]
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String,
            let songDicationaryArray = dictionary[kSong] as? [[String: AnyObject]] else {return nil}
        
        self.name = name
        self.songs = songDicationaryArray.flatMap{Song(dictionary: $0)}
    }
    
//    init?(dictionary: [String: AnyObject]) {
//        guard let name = dictionary[kName] as? String,
//            let songDictionaryArray = dictionary[kSong] as? [[String: AnyObject]] else {return nil}
//        
//        self.name = name
//        
//        self.songs = songDictionaryArray.flatMap{Song(dictionary: $0)}
//        // Or you can do the below method
////        var songArray: [Song] = []
////        for songDictionary in songDictionaryArray {
////            if let song = Song(dictionary: songDictionary) {
////                songArray.append(song)
////            }
////        }
////        self.songs = songArray
//    }
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
    
}