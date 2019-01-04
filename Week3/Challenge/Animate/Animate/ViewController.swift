//
//  ViewController.swift
//  Animate
//
//  Created by Taylor Mott on 11/16/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var yConstraint: NSLayoutConstraint?
    var drawerShown = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        let ghostImageView = UIImageView(frame: CGRectMake(157, 157, 100, 100))
//        ghostImageView.image = UIImage(named: "ghost")
//        self.view.addSubview(ghostImageView)
//        
//        ghostImageView.alpha = 0.0
//        
//        let rotationTransform = CGAffineTransformMakeRotation(CGFloat(M_PI))
//        let scaleTransform = CGAffineTransformMakeScale(2, 2)
//        
//        UIView.animateWithDuration(2.0) { () -> Void in
//            ghostImageView.alpha = 1
//            ghostImageView.center = CGPoint(x: ghostImageView.center.x, y: ghostImageView.center.y - 100)
//            ghostImageView.transform = CGAffineTransformConcat(rotationTransform, scaleTransform)
//        }
//        
//        let happyGhostView = UIImageView(frame: CGRectMake(10, 100, 100, 100))
//        happyGhostView.image = UIImage(named: "happyGhost")
//        self.view.addSubview(happyGhostView)
//        
//        let scale = CGAffineTransformMakeScale(0.5, 0.5)
//        let rotation = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
//        
//        UIView.animateWithDuration(2.0) { () -> Void in
//            happyGhostView.alpha = 0.0
//            happyGhostView.center = CGPoint(x: happyGhostView.center.x, y: happyGhostView.center.y - 125)
//            happyGhostView.transform = CGAffineTransformConcat(scale, rotation)
//        }
//        
//        let rocketImageView = UIImageView(frame: CGRectMake(0, 275, 75, 75))
//        rocketImageView.image = UIImage(named: "rocket")
//        view.addSubview(rocketImageView)
//        
//        let basicAnimation = CABasicAnimation()
//        basicAnimation.keyPath = "position.x"
//        basicAnimation.fromValue = rocketImageView.center.x
//        basicAnimation.toValue = rocketImageView.center.x + 339
//        basicAnimation.duration = 1.5
//        
//        rocketImageView.layer.addAnimation(basicAnimation, forKey: "launch")
//        rocketImageView.center.x += 339
//        
//        let passwordImageView = UIImageView(frame: CGRectMake(58, 355, 298, 71))
//        passwordImageView.image = UIImage(named: "password")
//        view.addSubview(passwordImageView)
//        
//        let shakeAnimation = CAKeyframeAnimation()
//        shakeAnimation.keyPath = "position.x"
//        shakeAnimation.values = [0, 10, -10, 10, 0]
//        shakeAnimation.keyTimes = [0, 1/6.0, 3/6.0, 5/6.0, 1.0]
//        shakeAnimation.duration = 1.0
//        shakeAnimation.additive = true
//        passwordImageView.layer.addAnimation(shakeAnimation, forKey: "shake")
//        
//        ghostImageView.layer.addAnimation(shakeAnimation, forKey: "shake")
//        
//        let earthImageView = UIImageView(frame: CGRectMake(157,515, 100, 100))
//        earthImageView.image = UIImage(named: "earth")
//        view.addSubview(earthImageView)
//        
//        let satelliteImageView = UIImageView(frame: CGRectMake(157, 515, 50, 50))
//        satelliteImageView.image = UIImage(named: "satellite")
//        view.addSubview(satelliteImageView)
//        
//        let boundRect = CGRectMake(-60, -60, 170, 170)
//        
//        let orbitAnimation = CAKeyframeAnimation()
//        orbitAnimation.keyPath = "position"
//        orbitAnimation.path = CGPathCreateWithEllipseInRect(boundRect, nil)
//        orbitAnimation.duration = 4.0
//        orbitAnimation.additive = true
//        orbitAnimation.repeatCount = Float.infinity
//        orbitAnimation.calculationMode = kCAAnimationPaced
//        orbitAnimation.rotationMode = kCAAnimationRotateAuto
//        
//        satelliteImageView.layer.addAnimation(orbitAnimation, forKey: "orbit")
//        
//        
//        satelliteImageView.animationImages = [UIImage(named: "satellite")!, UIImage(named: "satellite1")!, UIImage(named: "satellite2")!, UIImage(named: "satellite3")!]
//        satelliteImageView.animationDuration = 2.0
//        satelliteImageView.animationRepeatCount = Int.max
//        satelliteImageView.startAnimating()
//
//        
//        let mouseImageView = UIImageView(frame: CGRectMake(0, 0, 90, 50))
//        mouseImageView.image = UIImage(named: "mouse")
//        view.addSubview(mouseImageView)
//        
//        let aroundScreen = CAKeyframeAnimation()
//        aroundScreen.keyPath = "position"
//        aroundScreen.path = CGPathCreateWithRect(CGRect(x: 25, y: 25, width: view.frame.width - 50, height: view.frame.height - 50), nil)
//        aroundScreen.duration = 4
//        aroundScreen.repeatCount = Float.infinity
//        aroundScreen.calculationMode = kCAAnimationPaced
//        aroundScreen.rotationMode = kCAAnimationRotateAuto
//        
//        mouseImageView.layer.addAnimation(aroundScreen, forKey: "around")
        
        let drawerView = UIView()
        drawerView.backgroundColor = .purpleColor()
        drawerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(drawerView)
        
        let xConstraint = NSLayoutConstraint(item: drawerView, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        view.addConstraint(xConstraint)
        
        yConstraint = NSLayoutConstraint(item: drawerView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -80) //Property defined above
        view.addConstraint(yConstraint!)
        
        let heightConstraint = NSLayoutConstraint(item: drawerView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 80)
        view.addConstraint(heightConstraint)
        
        let widthConstraint = NSLayoutConstraint(item: drawerView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(widthConstraint)
        
        // Button
        
        let button = UIButton(frame: CGRectMake(50, 50, 50, 50))
        button.setTitle("Toggle Drawer", forState: .Normal)
        button.setTitleColor(.blueColor(), forState: .Normal)
        button.backgroundColor = .grayColor()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: "toggledDrawerView", forControlEvents: .TouchUpInside)
        view.addSubview(button)
        
        var constraint = NSLayoutConstraint(item: button, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: button, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 44)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.5, constant: 0.0)
        view.addConstraint(constraint)
        
        
        
        
//        let toggleDrawerButton = UIButton(frame: CGRect(x: 0, y: 45, width: CGRectGetWidth(view.frame), height: 50))
//        toggleDrawerButton.setTitle("Toggle Drawer", forState: .Normal)
//        toggleDrawerButton.setTitleColor(.blackColor(), forState: .Normal)
//        toggleDrawerButton.addTarget(self, action: "toggleDrawer", forControlEvents: .TouchUpInside) // Add function below see step 11
//        view.addSubview(toggleDrawerButton)
        
        
    }

    func toggledDrawerView() {
        guard let yConstraint = yConstraint else { return }
        view.layoutIfNeeded()
        
        if drawerShown {
            yConstraint.constant = 0.0
        } else {
            yConstraint.constant = -80
        }
        
        UIView.animateWithDuration(0.75) { () -> Void in
            self.view.layoutIfNeeded()
        }
        
        drawerShown = !drawerShown
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

