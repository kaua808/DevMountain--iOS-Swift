//
//  ViewController.swift
//  Calculator
//
//  Created by Taylor Mott on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var blankLabel = UILabel()
    var answerLabel = UILabel()
    var zeroButton = UIButton()
    var oneButton = UIButton()
    var twoButton = UIButton()
    var threeButton = UIButton()
    var fourButton = UIButton()
    var fiveButton = UIButton()
    var sixButton = UIButton()
    var sevenButton = UIButton()
    var eightButton = UIButton()
    var nineButton = UIButton()
    var enterButton = UIButton()
    var multiplyButton = UIButton()
    var addButton = UIButton()
    var subtractButton = UIButton()
    var devideButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLabel()
        createButtonOne()
        createButtonTwo()
        addConstraints()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBlankLabel() {
        blankLabel.backgroundColor = .blackColor()
        view.addSubview(blankLabel)
    }
    
    func createLabel() {
        answerLabel.text = "0"
        answerLabel.textColor = .whiteColor()
        answerLabel.textAlignment = .Right
        //answerLabel.textAlignment = .
        answerLabel.font = .systemFontOfSize(45.0)
        answerLabel.backgroundColor = .blackColor()
        view.addSubview(answerLabel)
    }
    
    func createButtonOne() {
        
        oneButton.setTitle("1", forState: UIControlState.Normal)
        oneButton.backgroundColor = .orangeColor()
       // oneButton.addTarget(self, action: "buttonClicked", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(oneButton)
    }
    
    func createButtonTwo() {
        
        twoButton.setTitle("2", forState: UIControlState.Normal)
        twoButton.backgroundColor = .orangeColor()
        // oneButton.addTarget(self, action: "buttonClicked", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(twoButton)
        
    }
    
    func addConstraints() {
    
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        oneButton.translatesAutoresizingMaskIntoConstraints = false
        twoButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Answer label Constraints
        
        let verticalLabelConstraint = NSLayoutConstraint(item: answerLabel, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 100)
        view.addConstraint(verticalLabelConstraint)
        
        let horizontalLabelConstraint = NSLayoutConstraint(item: answerLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        view.addConstraint(horizontalLabelConstraint)
        
        let labelWidthConstraint = NSLayoutConstraint(item: answerLabel, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: 0)
        view.addConstraint(labelWidthConstraint)
        
        let labelHeightConstraint = NSLayoutConstraint(item: answerLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100)
        view.addConstraint(labelHeightConstraint)
        
        // oneButton
        
        let virticalBOneConstraint = NSLayoutConstraint(item: oneButton, attribute: .Top, relatedBy: .Equal, toItem: answerLabel, attribute: .Bottom, multiplier: 1, constant: 0)
        view.addConstraint(virticalBOneConstraint)
        
        let horizontalBOneConstraint = NSLayoutConstraint(item: oneButton, attribute: .Left, relatedBy: .Equal, toItem: answerLabel, attribute: .Left, multiplier: 1, constant: 0)
        view.addConstraint(horizontalBOneConstraint)
        
        let bOneWidth = NSLayoutConstraint(item: oneButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        view.addConstraint(bOneWidth)
        
        let bOneHeight = NSLayoutConstraint(item: oneButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.17, constant: 0)
        view.addConstraint(bOneHeight)
        
        // TwoButton
        
        let virticalBTwoConstraint = NSLayoutConstraint(item: twoButton, attribute: .Top, relatedBy: .Equal, toItem: answerLabel, attribute: .Bottom, multiplier: 1, constant: 0)
        view.addConstraint(virticalBTwoConstraint)
        
        let horizontalBTwoConstraint = NSLayoutConstraint(item: twoButton, attribute: .Left, relatedBy: .Equal, toItem: oneButton, attribute: .Right, multiplier: 1, constant: 0)
        view.addConstraint(horizontalBTwoConstraint)
        
        let bTwoWidth = NSLayoutConstraint(item: twoButton, attribute: .Width, relatedBy: .Equal, toItem: oneButton, attribute: .Width, multiplier: 1, constant: 0)
        view.addConstraint(bTwoWidth)
        
        let bTwoHeight = NSLayoutConstraint(item: twoButton, attribute: .Height, relatedBy: .Equal, toItem: oneButton, attribute: .Height, multiplier: 1, constant: 0)
        view.addConstraint(bTwoHeight)
        
    }
    
}