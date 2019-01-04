//
//  MovieController.swift
//  Movie Search Collection View
//
//  Created by Kaleo Kim on 2/24/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class MovieController {
    
    static func searchForMovies(searchTerm:String, completion:(movieArray:[Movie]?) -> Void){
        
        let url = NetworkController.baseURL(searchTerm)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            
            // Checking for ResultData
            guard let data = resultData else {
                print("No Data Returned")
                completion(movieArray: nil)
                return
            }
            
            do {
                let resultsAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                
                if let resultsDictionary = resultsAnyObject as? [String:AnyObject] {
                    if let resultsArray = resultsDictionary["results"] as? [[String:AnyObject]]
                    {
                        var arrayOfMovies:[Movie] = []
                        // Cycle through movieArray, convert to movies
                        for movieDictionary in resultsArray {
                            if let movie = Movie(json: movieDictionary) {
                                arrayOfMovies.append(movie)
                            }
                        }
                        completion(movieArray: arrayOfMovies)
                    } else {
                        completion(movieArray: nil)
                    }
                }
            } catch {
                completion(movieArray: nil)
            }
        }
    }
    
    static func searchForPopularMovies(completion:(movieArray:[Movie]?) -> Void){
        
        let url = NetworkController.popularURL()
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            
            // Checking for ResultData
            guard let data = resultData else {
                print("No Data Returned")
                completion(movieArray: nil)
                return
            }
            do {
                let resultsAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                
                if let resultsDictionary = resultsAnyObject as? [String:AnyObject] {
                    if let resultsArray = resultsDictionary["results"] as? [[String:AnyObject]]
                    {
                        var arrayOfMovies:[Movie] = []
                        // Cycle through movieArray, convert to movies
                        for movieDictionary in resultsArray {
                            if let movie = Movie(json: movieDictionary) {
                                arrayOfMovies.append(movie)
                            }
                        }
                        completion(movieArray: arrayOfMovies)
                    } else {
                        completion(movieArray: nil)
                    }
                }
            } catch {
                print(error)
                completion(movieArray: nil)
            }
        }
    }
    
    
}