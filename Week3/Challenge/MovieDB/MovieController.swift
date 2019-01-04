//
//  MovieController.swift
//  MovieDB
//
//  Created by Kaleo Kim on 2/18/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class MovieController {
    
    static let kBaseURLString = "http://api.themoviedb.org/3"
    static let kAPIKey = "9730fb5307b38c315c5b99aa52f32f31"
    
    static func getMoviesWithSearchTerm(searchTerm: String, completion: (movies : [Movie]) -> Void) {
        
        let escapedSearchTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())
        var movieSearchURLString = MovieController.kBaseURLString + "/search/movie/"
        
        // API KEY
        movieSearchURLString = movieSearchURLString + "?" + "api_key=" + MovieController.kAPIKey
        
        //QUERY
        movieSearchURLString = movieSearchURLString + "&" + "query=" + escapedSearchTerm!
        print(movieSearchURLString)
        if let url = NSURL(string: movieSearchURLString) {
            
            NetworkController.dataAtURL(url, completion: { (data) -> Void in
                
                if let data = data,
                    let jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: []),
                    let jsonDictionary = jsonAnyObject as? [String: AnyObject],
                    let resultsArray = jsonDictionary["results"] as? [[String: AnyObject]] {
                    
                        var movies = [Movie]()
                        for resultDictionary in resultsArray {
                            if let movie = Movie(jsonDictionary: resultDictionary) {
                                movies.append(movie)
                            }
                        }
                        
                        completion(movies: movies)
                    
                } else {
                    completion(movies: [])
                }
                
            })
            
        } else {
            // fi I cant get anything..
            completion(movies: [])
        }
        
    }
}