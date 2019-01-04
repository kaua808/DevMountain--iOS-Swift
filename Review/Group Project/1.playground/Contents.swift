//: Playground - noun: a place where people can play

import UIKit
import SpriteKit


func rightBarrierWall() {
    rightBorderWall.color = UIColor.purpleColor()
    rightBorderWall.name = "RightBorderWall"
    rightBorderWall.zPosition = 1
    rightBorderWall.size = CGSize(width: 20, height: CGRectGetMaxY(self.view!.frame))
    rightBorderWall.position = CGPoint(x: CGRectGetMaxX(self.view!.frame) + 5, y: CGRectGetMidY(self.view!.frame))
    
    //Physics
    rightBorderWall.physicsBody = SKPhysicsBody(rectangleOfSize: rightBorderWall.size)
    rightBorderWall.physicsBody?.categoryBitMask = PhysicsCategory.rightWall
    rightBorderWall.physicsBody?.contactTestBitMask = PhysicsCategory.circle | PhysicsCategory.randomCircle
    rightBorderWall.physicsBody?.collisionBitMask = PhysicsCategory.circle | PhysicsCategory.randomCircle
    rightBorderWall.physicsBody?.affectedByGravity = false
    rightBorderWall.physicsBody?.dynamic = false
    
    
    addChild(rightBorderWall)
}
    