//
//  ViewController.swift
//  Collection View play
//
//  Created by Kaleo Kim on 2/24/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let kMargin = CGFloat(50.0)
    
    @IBOutlet var collectionView: UICollectionView!
    
    var images = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "4")!, UIImage(named: "5"), UIImage(named: "6")]

    @IBOutlet var flowLayOut: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        flowLayOut.sectionInset = UIEdgeInsetsMake(0, kMargin, 0, kMargin)
        flowLayOut.minimumLineSpacing = 0
        flowLayOut.minimumInteritemSpacing = 0
        
    }

    // MARK: - CollectionView Delegate Flow Layout
    
    
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let viewWidth = view.frame.width
        let viewWidthMinusMargin = viewWidth - 2 * kMargin
        let itemDimension = viewWidthMinusMargin / 3.0
        
        return CGSizeMake(itemDimension, itemDimension)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - UICollectionView Data Source
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let imageCell = collectionView.dequeueReusableCellWithReuseIdentifier("imageCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        
        let image = images[indexPath.item]
        
        imageCell.imageView.image = image
        
        
        return imageCell
    }
    
}

