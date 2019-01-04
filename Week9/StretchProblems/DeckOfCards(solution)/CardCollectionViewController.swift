//
//  CardCollectionViewController.swift
//  DeckOfCards
//
//  Created by James Pacheco on 12/8/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CardCollectionViewController: UICollectionViewController {

    var clubs: [Card] {
        return CardController.SharedInstance.clubs
    }
    
    var spades: [Card] {
        return CardController.SharedInstance.spades
    }
    
    var diamonds: [Card] {
        return CardController.SharedInstance.diamonds
    }
    
    var hearts: [Card] {
        return CardController.SharedInstance.hearts
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CardController.fetchDeck { (deckID) -> Void in
            CardController.fetchCards({ (cards) -> Void in
                dispatch_async(dispatch_get_main_queue(), { 
                    self.collectionView?.reloadData()
                })
            })
        }

        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }



    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 4
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return clubs.count
        case 1:
            return spades.count
        case 2:
            return diamonds.count
        case 3:
            return hearts.count
        default:
            return 0
        }
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cardCell", forIndexPath: indexPath) as? CardCollectionViewCell {
            
            switch indexPath.section {
            case 0:
                let card = clubs[indexPath.row]
                cell.updateWithCard(card)
            case 1:
                let card = spades[indexPath.row]
                cell.updateWithCard(card)
            case 2:
                let card = diamonds[indexPath.row]
                cell.updateWithCard(card)
            case 3:
                let card = hearts[indexPath.row]
                cell.updateWithCard(card)
            default:
                break
            }
            
            return cell
        }
    
        return UICollectionViewCell()
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
