//
//  MovieController.swift
//  searchController
//
//  Created by Kaleo Kim on 4/26/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

protocol MovieControllerDelegate: class {
    func nowPlayingMoviesChanged()
}

class MovieController {
    
    static let sharedInstance = MovieController()
    
    var nowPlayingMovies: [Movie] = [] {
        didSet {
            delegate?.nowPlayingMoviesChanged()
        }
    }
    
    weak var delegate: MovieControllerDelegate?
    
    init() {
        nowPLayingMovies { (success) in
            print(success)
        }
    }
    
    func nowPLayingMovies(completion: (success: Bool) -> Void) {
        
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=68a8779098e355ac704c413416c684af"
        
        NetworkController.dataAtURL(url) { (success, data) in
            
            guard let data = data,
                let json = NetworkController.jsonSerialization(data),
                let movieDictionary = json["results"] as? [[String: AnyObject]]else {completion(success: false); return}
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.nowPlayingMovies = movieDictionary.flatMap({Movie(json: $0)})
                completion(success: true)
            })
        }
    }
    
    func searchForMovie(title: String, completion: (movie: [Movie]) -> Void) {
        
        let modifiedSearch = title.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
        let url = "http://api.themoviedb.org/3/search/movie?query=\(modifiedSearch)&api_key=68a8779098e355ac704c413416c684af"
        
        NetworkController.dataAtURL(url) { (success, data) in
            
            guard let data = data,
                let json = NetworkController.jsonSerialization(data),
                let movieDictionary = json["results"] as? [[String: AnyObject]] else {completion(movie: []); return }

            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let movies = movieDictionary.flatMap({Movie(json: $0)})
                completion(movie: movies)
            })
        }
    }
}