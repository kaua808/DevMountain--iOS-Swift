//
//  CardCollectionViewCell.swift
//  DeckOfCards
//
//  Created by James Pacheco on 12/8/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    func updateWithCard(card: Card) {
        ImageController.imageForURL(card.imageURL) { (image) in
            if let image = image {
                self.cardImageView.image = image
            }
        }
    }
}
