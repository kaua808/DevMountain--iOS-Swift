//
//  ViewController.swift
//  Animations
//
//  Created by Kaleo Kim on 4/20/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let blueButton = UIButton()
    let yellowButton = UIButton()
    let greenButton = UIButton()
    let redBUtton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        setupHeightAndWidth()
        addViewConstraint()
        addTarget()
        
    }
    
    func addTarget() {
        greenButton.addTarget(self, action: #selector(animateView), forControlEvents: .TouchUpInside)
        yellowButton.addTarget(self, action: #selector(animateView), forControlEvents: .TouchUpInside)
        blueButton.addTarget(self, action: #selector(animateView), forControlEvents: .TouchUpInside)
        redBUtton.addTarget(self, action: #selector(animateView), forControlEvents: .TouchUpInside)
    }
    
    func animateView() {

        let topLeftColor = greenButton.backgroundColor
        let topRightColor = yellowButton.backgroundColor
        let bottomLeftColor = blueButton.backgroundColor
        let bottomRightColor = redBUtton.backgroundColor
        
        UIView.animateWithDuration(1.0) {
            self.greenButton.backgroundColor = bottomLeftColor
            self.yellowButton.backgroundColor = topLeftColor
            self.redBUtton.backgroundColor = topRightColor
            self.blueButton.backgroundColor = bottomRightColor
            
        }
        
    }
    
    func setupButton() {
        
        blueButton.backgroundColor = .blueColor()
        yellowButton.backgroundColor = .yellowColor()
        greenButton.backgroundColor = .greenColor()
        redBUtton.backgroundColor = .redColor()
        
        view.addSubview(blueButton)
        view.addSubview(yellowButton)
        view.addSubview(greenButton)
        view.addSubview(redBUtton)
        
    }
    
    func setupHeightAndWidth() {
        
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        yellowButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        redBUtton.translatesAutoresizingMaskIntoConstraints = false
        
        let topButtonConstraint = NSLayoutConstraint(item: greenButton, attribute: .Width, relatedBy: .Equal, toItem: yellowButton, attribute: .Width, multiplier: 1.0, constant: 0)
        let leftButtonConstraint = NSLayoutConstraint(item: greenButton, attribute: .Height, relatedBy: .Equal, toItem: blueButton, attribute: .Height, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: blueButton, attribute: .Width, relatedBy: .Equal, toItem: redBUtton, attribute: .Width, multiplier: 1.0, constant: 0)
        let rightBottomConstraint = NSLayoutConstraint(item: redBUtton, attribute: .Height, relatedBy: .Equal, toItem: yellowButton, attribute: .Height, multiplier: 1.0, constant: 0)
     
        view.addConstraints([topButtonConstraint, leftButtonConstraint, bottomConstraint, rightBottomConstraint])
    }
    
    func addViewConstraint() {
        let greenTopConstraint = NSLayoutConstraint(item: greenButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        let greenLeadingConstraint = NSLayoutConstraint(item: greenButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        let yellowTopConstraint = NSLayoutConstraint(item: yellowButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        let yellowTrailingConstraint = NSLayoutConstraint(item: yellowButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        let blueBottomConstraint = NSLayoutConstraint(item: blueButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let blueLeadingConstraint = NSLayoutConstraint(item: blueButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        let redBottomConstrain = NSLayoutConstraint(item: redBUtton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let redTrailingConstraint = NSLayoutConstraint(item: redBUtton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        
        //setupFrameConstraint
        let topConstraints = NSLayoutConstraint(item: greenButton, attribute: .Trailing, relatedBy: .Equal, toItem: yellowButton, attribute: .Leading, multiplier: 1.0, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: greenButton, attribute: .Bottom, relatedBy: .Equal, toItem: blueButton, attribute: .Top, multiplier: 1.0, constant: 0)
        let bottomConstrain = NSLayoutConstraint(item: blueButton, attribute: .Trailing, relatedBy: .Equal, toItem: redBUtton, attribute: .Leading, multiplier: 1.0, constant: 0)
        let rightConstraints = NSLayoutConstraint(item: yellowButton, attribute: .Bottom, relatedBy: .Equal, toItem: redBUtton, attribute: .Top, multiplier: 1.0, constant: 0)
        
        view.addConstraints([greenTopConstraint, greenLeadingConstraint, yellowTopConstraint, yellowTrailingConstraint, blueBottomConstraint, blueLeadingConstraint, redBottomConstrain, redTrailingConstraint, topConstraints, leftConstraint, bottomConstrain, rightConstraints])
    }

}

