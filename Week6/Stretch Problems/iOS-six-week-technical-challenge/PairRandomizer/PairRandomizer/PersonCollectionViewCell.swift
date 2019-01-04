//
//  PersonCollectionViewCell.swift
//  PairRandomizer
//
//  Created by Kaleo Kim on 3/11/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    
    func updateCellWithName(person: Person) {
        nameLabel.text = person.name
    }
}
