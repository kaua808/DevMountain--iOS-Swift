//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Kaleo Kim on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var ratingLabel: UILabel!
    
    @IBOutlet var summeryLabel: UILabel!
    
    @IBOutlet var posterImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(movie: Movie) {
        
        ImageController.imageAtURL(movie) { (image) in
            self.posterImage.image = image
        }
        
        titleLabel.text = movie.title
        ratingLabel.text = String(movie.rating)
        summeryLabel.text = movie.summary
        
    }
    
    
    

}
