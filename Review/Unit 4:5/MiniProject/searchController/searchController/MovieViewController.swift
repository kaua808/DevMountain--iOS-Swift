//
//  MovieViewController.swift
//  searchController
//
//  Created by Kaleo Kim on 4/26/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

private let reuseIdentifier = "movieCell"

class MovieViewController: UIViewController, UISearchResultsUpdating, MovieControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var headerView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        
        MovieController.sharedInstance.delegate = self
    }
    
    func setupSearchController() {
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resultsController")
        
        searchController = UISearchController(searchResultsController: resultsController)
        guard let searchController = searchController else { return }
        searchController.searchResultsUpdater = self
        
        self.headerView.addSubview(searchController.searchBar)
        searchController.searchBar.placeholder = "Search All Movies"
        searchController.searchBar.sizeToFit()
        searchController.definesPresentationContext = true
        
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else {return}
//        
//        MovieController.sharedInstance.searchForMovie(text) { (movie) in
//            guard let resultsController = self.searchController?.searchResultsController as? ResultsCollectionViewController else {return}
//            
//            resultsController.filteredMovies = movie
//            resultsController.collectionView?.reloadData()
//        }
        
        guard let text = searchController.searchBar.text,
            let resultsController = searchController.searchResultsController as? ResultsCollectionViewController else {return}
        
        MovieController.sharedInstance.searchForMovie(text) { (movie) in
            resultsController.filteredMovies = movie
            resultsController.collectionView?.reloadData()
        }
    }
    
    
    
    func nowPlayingMoviesChanged() {
        self.collectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return MovieController.sharedInstance.nowPlayingMovies.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? MovieCollectionViewCell
        
        let movie = MovieController.sharedInstance.nowPlayingMovies[indexPath.row]
        
        cell?.updateWithMovie(movie)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width / 2 - 1, height: self.view.frame.height / 2 - 1)
        
    }
}
