//
//  ViewController.swift
//  Calculator
//
//  Created by Taylor Mott on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calculatedLabel = UILabel()
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
    var plusButton = UIButton()
    var minusButton = UIButton()
    var divideButton = UIButton()
    var multiplicationButton = UIButton()
    var enterButton = UIButton()
    
    var displayNumber = ""
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        createLabel()
        createAllButtons()
        addColorToView()
        createConstraintsForButtons()
        addTitlesToNumberButtons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UI Creation
    
    // Creates The Math Display Label
    func createLabel() {
        calculatedLabel.translatesAutoresizingMaskIntoConstraints = false
        calculatedLabel.backgroundColor = UIColor.blackColor()
        calculatedLabel.textColor = .whiteColor()
        calculatedLabel.text = "0"
        calculatedLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 60)
        calculatedLabel.textAlignment = .Right
        
        view.addSubview(calculatedLabel)
        
    }
    
    
    // Creates Each Button With It's Default Attributes
    func createAllButtons() {
        let buttonArray = [zeroButton, sevenButton, eightButton, nineButton, divideButton, fourButton, fiveButton, sixButton, multiplicationButton, oneButton, twoButton, threeButton, minusButton, enterButton, plusButton]
        
        for button in buttonArray {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.whiteColor()
            button.layer.borderWidth = 1
            button.clipsToBounds = true
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 30)
            button.layer.borderColor = UIColor.blackColor().CGColor
            //button.addTarget(self, action: #selector(buttonTappedOnScreen), forControlEvents: .TouchUpInside)
            self.view.addSubview(button)
        }
    }
    
    
    // MARK: - UI Color and Text
    
    // Adds Background color to all buttons in view
    func addColorToView() {
        let buttonArray = [zeroButton, sevenButton, eightButton, nineButton, divideButton, fourButton, fiveButton, sixButton, multiplicationButton, oneButton, twoButton, threeButton, minusButton, enterButton, plusButton]
        for button in buttonArray {
            switch button {
            case zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton:
                button.backgroundColor = UIColor(red: 0.667, green: 0.667, blue: 0.667, alpha: 1.00)
            case divideButton, multiplicationButton, minusButton, plusButton:
                button.backgroundColor = UIColor(red: 0.992, green: 0.502, blue: 0.137, alpha: 1.00)
                button.setTitleColor(.whiteColor(), forState: .Normal)
            default:
                button.backgroundColor = UIColor(red: 0.392, green: 0.541, blue: 0.404, alpha: 1.00)
                button.setTitleColor(.whiteColor(), forState: .Normal)
            }
        }
        
    }
    
    
    // Function Adds Titles To All Buttons
    func addTitlesToNumberButtons() {
        let buttonArray = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        var count = 0
        for button in buttonArray {
            button.setTitle("\(count)", forState: .Normal)
            count += 1
        }
        multiplicationButton.setTitle("x", forState: .Normal)
        divideButton.setTitle("/", forState: .Normal)
        minusButton.setTitle("-", forState: .Normal)
        plusButton.setTitle("+", forState: .Normal)
        enterButton.setTitle("Enter", forState: .Normal)
    }
    
    // MARK: - CONSTRAINTS
    
    // Adds Constraints To Every Item In The View
    func createConstraintsForButtons() {
        
        // Calculated Label Horizontal and Vertical Constraints
        let calcHorizontalConstraint = NSLayoutConstraint(item: calculatedLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        let calcTopMarginContstraint = NSLayoutConstraint(item: calculatedLabel, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 0)
        
        // Calculated Label Height and Width Constraints
        let calcWidthConstraints = NSLayoutConstraint(item: calculatedLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1, constant: 0)
        let calcHeightConstraints = NSLayoutConstraint(item: calculatedLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.30, constant: 0)
        
        self.view.addConstraints([ calcHorizontalConstraint, calcHeightConstraints, calcWidthConstraints, calcTopMarginContstraint])
        
        
        let buttonArray = [zeroButton, sevenButton, eightButton, nineButton, divideButton, fourButton, fiveButton, sixButton, multiplicationButton, oneButton, twoButton, threeButton, minusButton, enterButton, plusButton]
        
        // Add Height and Width Constraints
        for button in buttonArray {
            if button == zeroButton {
                let heightConstraint = NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.175, constant: 0)
                let widthConstraint = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0)
                self.view.addConstraints([heightConstraint, widthConstraint])
            } else {
                let heightConstraint = NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.175, constant: 0)
                let widthConstraint = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.25, constant: 0)
                self.view.addConstraints([heightConstraint, widthConstraint])
            }
        }
        
        // Add button horizontal Constraint
        for button in buttonArray {
            switch button {
            case sevenButton, fourButton, oneButton, zeroButton:
                let buttonHorizontalConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonHorizontalConstraint)
            case divideButton, multiplicationButton, minusButton, plusButton:
                let buttonHorizontalConstraint = NSLayoutConstraint(item: button, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonHorizontalConstraint)
            case eightButton, fiveButton, twoButton:
                let buttonHorizontalConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: sevenButton, attribute: .Trailing, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonHorizontalConstraint)
            case nineButton, sixButton, threeButton:
                let buttonHorizontalConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: eightButton, attribute: .Trailing, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonHorizontalConstraint)
            case enterButton:
                let buttonHorizontalConstraint = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: zeroButton, attribute: .Trailing, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonHorizontalConstraint)
            default:
                return
            }
        }
        
        // Add Button Vertical Constraint
        for button in buttonArray {
            switch button {
            case sevenButton, eightButton, nineButton, divideButton:
                let buttonVerticalConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: calculatedLabel, attribute: .Bottom, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonVerticalConstraint)
            case fourButton, fiveButton, sixButton, multiplicationButton:
                let buttonVerticalConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: eightButton, attribute: .Bottom, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonVerticalConstraint)
            case oneButton, twoButton, threeButton, minusButton:
                let buttonVerticalConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: fiveButton, attribute: .Bottom, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonVerticalConstraint)
            case zeroButton, enterButton, plusButton:
                let buttonVerticalConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: threeButton, attribute: .Bottom, multiplier: 1, constant: 0)
                self.view.addConstraint(buttonVerticalConstraint)
            default:
                return
            }
        }
    }
    
    // MARK: - BUTTON ACTION FUNCTIONS
    
    
    // Takes in sender (button) and sends it to the calculator controller. This function also updates the calculator output
//    func buttonTappedOnScreen(sender: UIButton!) {
//        switch sender {
//        case enterButton:
//            guard let output = calculator.enterPressed() else { return }
//            calculatedLabel.text = output
//        case divideButton, minusButton, plusButton, multiplicationButton:
//            guard let input = sender.titleLabel?.text else { return }
//            calculator.operationReceived(input)
//        default:
//            guard let input = sender.titleLabel?.text else { return }
//            let output = calculator.numberReceived(input)
//            calculatedLabel.text = output
//        }
//    }
}