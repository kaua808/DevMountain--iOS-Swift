//
//  MovieCollectionViewCell.swift
//  searchController
//
//  Created by Kaleo Kim on 4/26/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieImageView: UIImageView!
    
    var movie: Movie?
    
    func updateWithMovie(movie: Movie) {
        self.movie = movie
        movieImageView.image = nil
        self.movieTitle.text = movie.title
        ImageController.imageAtURL(movie) { (image) in
            if let thisMovie = self.movie where movie.title == thisMovie.title {
                self.movieImageView.image = image
            }
        }
    }
}
