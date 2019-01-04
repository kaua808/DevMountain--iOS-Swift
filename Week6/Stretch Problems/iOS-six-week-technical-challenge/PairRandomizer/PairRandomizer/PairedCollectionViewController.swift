//
//  PairedCollectionViewController.swift
//  PairRandomizer
//
//  Created by Kaleo Kim on 3/11/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit
import GameplayKit

private let reuseIdentifier = "nameCell"

class PairedCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var peopleArray = PersonController.sharedInstance.people
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        PersonController.sharedInstance.shufflePeople()
        
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return PersonController.sharedInstance.randomArr.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PersonCollectionViewCell
        
        let person = PersonController.sharedInstance.randomArr[indexPath.row]
        
        cell.updateCellWithName(person)
    
        return cell
    }
    
    // MARK: - Flow Layout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
     
    return CGSize(width: self.view.frame.width / 3, height: 45)
        
    }

}