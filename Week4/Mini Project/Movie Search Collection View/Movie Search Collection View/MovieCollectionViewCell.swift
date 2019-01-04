//
//  MovieCollectionViewCell.swift
//  Movie Search Collection View
//
//  Created by Kaleo Kim on 2/24/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var summeryLabel: UILabel!
    
    func updateCellWithMovie(movie: Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)"
        summeryLabel.text = movie.summary
    }
    
}
