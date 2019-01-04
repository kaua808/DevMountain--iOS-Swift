//
//  ViewController.swift
//  ProgramaticLayoutMiniLesson
//
//  Created by Kaleo Kim on 2/19/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myButton = UIButton()
    var titleLabel = UILabel()
    var textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGrayColor()
        createButton()
        createLabel()
        creatTextField()
        addConstraints()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createButton() {
        myButton.setTitle("submit", forState: UIControlState.Normal)
        myButton.backgroundColor = .blueColor()
        myButton.layer.cornerRadius = 8
        myButton.layer.borderColor = UIColor.blackColor().CGColor
        myButton.layer.borderWidth = 2
        myButton.addTarget(self, action: "buttonClicked", forControlEvents: .TouchUpInside)

        self.view.addSubview(myButton)
    }
    
    func createLabel() {
        titleLabel.text = "hello world"
        titleLabel.textAlignment = .Center
        self.view.addSubview(titleLabel)
    }
    
    func creatTextField() {
        
        textField.placeholder = "Entre New Title Here"
        textField.textAlignment = .Center
        self.view.addSubview(textField)
    }
    
    func addConstraints() {
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        // For Button
        let horizontalContraint = NSLayoutConstraint(item: myButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        view.addConstraint(horizontalContraint)
        
        let verticalConstraint = NSLayoutConstraint(item: myButton, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        view.addConstraint(verticalConstraint)
        
        let widthConstraint = NSLayoutConstraint(item: myButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.75, constant: 0)
        view.addConstraint(widthConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: myButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100)
        view.addConstraint(heightConstraint)
        
        // For Label
        
        let verticalLabelConstraint = NSLayoutConstraint(item: titleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: myButton, attribute: .CenterY, multiplier: 1.0, constant: -100)
        view.addConstraint(verticalLabelConstraint)
        
        let horizontalLayoutConstraint = NSLayoutConstraint(item: titleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: myButton, attribute: .CenterX, multiplier: 1.0, constant: 0)
        view.addConstraint(horizontalLayoutConstraint)
        
        let labelHeight = NSLayoutConstraint(item: titleLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50)
        view.addConstraint(labelHeight)
        
        let labelWidth = NSLayoutConstraint(item: titleLabel, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.75, constant: 0)
        view.addConstraint(labelWidth)
        
        // create textField
        
        let verticalTextFieldConstraint = NSLayoutConstraint(item: textField, attribute: .CenterY, relatedBy: .Equal, toItem: myButton, attribute: .CenterY, multiplier: 1.0, constant: 100)
        view.addConstraint(verticalTextFieldConstraint)
        
        let horizontalTextFieldConstraint = NSLayoutConstraint(item: textField, attribute: .CenterX, relatedBy: .Equal, toItem: myButton, attribute: .CenterX, multiplier: 1.0, constant: 0)
        view.addConstraint(horizontalTextFieldConstraint)
        
        let textFieldHeight = NSLayoutConstraint(item: textField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50)
        view.addConstraint(textFieldHeight)
        
        let textFieldWidth = NSLayoutConstraint(item: textField, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.75, constant: 0)
        view.addConstraint(textFieldWidth)
        
    }

    func buttonClicked () {
        titleLabel.text = textField.text
    }
    
}







