//
//  HomeViewController.swift
//  Movie Search Collection View
//
//  Created by Kaleo Kim on 2/24/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var results: [Movie]?
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSearchController()

        // that movieArray is the data coming from the request
        MovieController.searchForPopularMovies { (movieArray) -> Void in
            if let movies = movieArray {
                self.results = movies
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            }
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // you can unwrap it like this...
        
//        if let results = results {
//            return results.count
//        }
        
        // or like this..
        
        return results?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieTableCell", forIndexPath: indexPath)
        
        if let movies = results {
            let movie = movies[indexPath.row]
            
            cell.textLabel?.text = movie.title
            cell.detailTextLabel?.text = movie.summary
        }
        
        return cell
    }
    
}

extension HomeViewController: UISearchResultsUpdating {

    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!.lowercaseString
        
        MovieController.searchForMovies(searchTerm) { (movieArray) -> Void in
            if let movies = movieArray {
                if let resultsController = searchController.searchResultsController as? ResultsCollectionViewController {
                    resultsController.filteredMovies = movies
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        resultsController.collectionView?.reloadData()
                    })
                }
            }
        }
    }
    
    func setUpSearchController() {
        
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resultsCollectionVC")
        
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "Search movie titles..."
        
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
    }
    
}



















