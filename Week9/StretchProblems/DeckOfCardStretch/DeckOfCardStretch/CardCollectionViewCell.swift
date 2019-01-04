//
//  CardCollectionViewCell.swift
//  DeckOfCardStretch
//
//  Created by Kaleo Kim on 3/29/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cardImage: UIImageView!
    @IBOutlet var cardLabel: UILabel!
    
    func updateCellWithCard(card: Card) {
        
        self.cardLabel.text = "\(card.value) of \(card.suite)"
        
    }
    
}
