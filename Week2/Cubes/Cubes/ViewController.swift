//
//  ViewController.swift
//  Cubes
//
//  Created by Kaleo Kim on 2/8/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScene()
    }
    
    private var coneNode: SCNNode?
    private var sphereNode: SCNNode?
    private var cubeNode: SCNNode?
    private func setUpScene() {
        
        // configure the scene view
        self.sceneView.backgroundColor = .darkGrayColor()
        
        // create the scene
        let scene = SCNScene()
        
        // creat a camera ad attach it to a node
        let camera = SCNCamera()
        camera.xFov = 10
        camera.yFov = 45
        
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, 0, 50)
        scene.rootNode.addChildNode(cameraNode)
        
        // Create a cube and place in scene
        let cube = SCNBox(width: 5, height: 5, length: 5, chamferRadius: 0)
        cube.firstMaterial?.diffuse.contents = UIColor(red: 0.149, green: 0.604, blue: 0.859, alpha: 1.0)
        let cubeNode = SCNNode(geometry: cube)
        scene.rootNode.addChildNode(cubeNode)
        self.cubeNode = cubeNode
        
        // create cone
        let cone = SCNCone(topRadius: 0, bottomRadius: 4, height: 6)
        cone.firstMaterial?.diffuse.contents = UIColor(red: 0.149, green: 0.604, blue: 0.859, alpha: 1.0)
        let coneNode = SCNNode(geometry: cone)
        scene.rootNode.addChildNode(coneNode)
        self.coneNode = coneNode
        
        // create sphere
        let sphereGeometry = SCNSphere(radius: 3.0)
        sphereGeometry.firstMaterial?.diffuse.contents = UIColor(red: 0.149, green: 0.604, blue: 0.859, alpha: 1.0)
        let sphereNode = SCNNode(geometry: sphereGeometry)
        scene.rootNode.addChildNode(sphereNode)
        self.sphereNode = sphereNode
        
        // add an animation
        let animation = CAKeyframeAnimation(keyPath: "rotation")
        
        animation.values = [NSValue(SCNVector4: SCNVector4(1, 1, 0.3, 0 * M_PI)),
            NSValue(SCNVector4: SCNVector4(1, 1, 0.3, 1 * M_PI)),
            NSValue(SCNVector4: SCNVector4(1, 1, 0.3, 2 * M_PI))]
        animation.duration = 5
        animation.repeatCount = HUGE
        self.cubeNode?.addAnimation(animation, forKey: "rotation")
        //self.cubeNode?.paused = false
        self.sphereNode?.addAnimation(animation, forKey: "rotation")
        //self.sphereNode?.paused = false
        
        self.sceneView.scene = scene
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        if let touchPoint = touch?.locationInView(self.sceneView),
            hitTestResult = self.sceneView.hitTest(touchPoint, options: nil).first {
                let hitNode = hitTestResult.node
                hitNode.paused = !hitNode.paused
        }
    }
    
}

