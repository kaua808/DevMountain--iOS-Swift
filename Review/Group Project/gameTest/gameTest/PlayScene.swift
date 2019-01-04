//
//  PlayScene.swift
//  gameTest
//
//  Created by Kaleo Kim on 5/15/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import SpriteKit

class PlayScene: SKScene {
    
    
    //var node = SKSpriteNode()
    
    
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = .whiteColor()
        

        
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: #selector(spawnNode), userInfo: nil, repeats: true)
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if let theName = self.nodeAtPoint(location).name {
                if theName == "Destroyable" {
                    self.removeChildrenInArray([self.nodeAtPoint(location)])
                    print("tapped")
                }
            }
        }
    }
    
    func spawnNode() {
        
        // we want it to spawn from different stpots from the top.
        let minValue = self.size.width / 8
        let maxValue = self.size.width - 20
        //let spawnPoint = UInt32(maxValue - minValue)
        
        let spawnPoint = CGFloat(arc4random_uniform(UInt32(maxValue - minValue)))
        
        // create the node
        var node = SKShapeNode()
        //self.node = SKSpriteNode(imageNamed: "ball")
        node = SKShapeNode(rectOfSize: CGSize(width: 50, height: 50))
        node.name = "Destroyable"
        node.fillColor = .blackColor()
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        node.position = CGPoint(x: spawnPoint, y: self.size.height)
        let action = SKAction.moveToY(-30, duration: NSTimeInterval(actualDuration))
        node.runAction(SKAction.repeatActionForever(action))
        
        let numberLabel = SKLabelNode(text: "4")
        numberLabel.name = "Destroyable"
        numberLabel.fontName = "Chalkduster"
        
        numberLabel.position = CGPoint(x: CGRectGetMidX(node.frame), y: CGRectGetMidY(node.frame)-5)
        numberLabel.fontSize = 15
        numberLabel.fontColor = UIColor.whiteColor()
        numberLabel.runAction(SKAction.repeatActionForever(action))

        
        self.addChild(node)
        node.addChild(numberLabel)
    }
    
    
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
}

