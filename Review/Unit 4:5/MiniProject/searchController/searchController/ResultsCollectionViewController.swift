//
//  ResultsCollectionViewController.swift
//  searchController
//
//  Created by Kaleo Kim on 4/26/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

private let reuseIdentifier = "movieCell"

class ResultsCollectionViewController: UICollectionViewController {
    
    var filteredMovies: [Movie] = []


    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return filteredMovies.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? MovieCollectionViewCell
        
        let movie = filteredMovies[indexPath.row]
        
        cell?.updateWithMovie(movie)
    
        // Configure the cell
    
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width / 3 - 10, height: self.view.frame.width / 3 - 10)
        
    }


}
