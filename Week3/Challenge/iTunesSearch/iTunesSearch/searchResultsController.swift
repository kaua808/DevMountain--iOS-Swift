//
//  searchResultsController.swift
//  iTunesSearch
//
//  Created by Kaleo Kim on 2/17/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class SearchResultsController {
    
    func searchResultsforTerm(term: String, completion: (results:[SearchResults]?) -> Void) {

        // - serialize results into SearchResults object
        // - run completion with resulting array
        
        let url = NSURL(string: "https://itunes.apple.com/search?term=angry+birds&media=software&entity=software")
        
        NetworkController.fetchJSONAtURL(url!) { (jsonData) -> Void in
            
            guard let checkedData = jsonData as? [[String: AnyObject]] else {
                print("incorrect format")
                completion(results: nil)
                return
            }
            var collectionOfResults: [SearchResults] = []
            
            for dictionary in checkedData {
                let searchResults = SearchResults(dictionary: dictionary)
                collectionOfResults.append(searchResults!)
                
            }
            
            completion(results: collectionOfResults)
            
        }
        
    }
    
}
