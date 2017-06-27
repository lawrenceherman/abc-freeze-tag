//
//  GameViewController.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 6/26/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene()
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 5, z: 100)
//
        let cameraVector = SCNVector3(x: 3, y: 0, z:0)
        cameraNode.eulerAngles = cameraVector
//
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        let floor = SCNFloor()
        let floorMaterial = SCNMaterial()
        
        
        floor.material(named: <#T##String#>)
        
        let floorNode = SCNNode(geometry: floor)
        
        
        
        
        scene.rootNode.addChildNode(floorNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
//        scene.background.contents = UIImage(named: "playground2")
        
        scene.background.contents = UIColor.blue
        

        let letterA = SCNText(string: "A", extrusionDepth: 2.0)
        letterA.font = UIFont.init(name: "Ariel", size: 12.0)
        let letterANode = SCNNode(geometry: letterA)
        letterANode.position = SCNVector3(x: 0, y: -3, z: 0)
        scene.rootNode.addChildNode(letterANode)
        
        let letterB = SCNText(string: "B", extrusionDepth: 2.0)
        letterB.font = UIFont.init(name: "Ariel", size: 12.0)
        let letterBNode = SCNNode(geometry: letterB)
        letterBNode.position = SCNVector3(x: 10, y: 0, z: 0)
        scene.rootNode.addChildNode(letterBNode)
        
        let letterC = SCNText(string: "C", extrusionDepth: 2.0)
        letterC.font = UIFont.init(name: "Ariel", size: 12.0)
        let letterCNode = SCNNode(geometry: letterC)
        letterCNode.position = SCNVector3(x: 20, y: 0, z: 0)
        scene.rootNode.addChildNode(letterCNode)

      
      
        
        
        // retrieve the ship node
//        let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!
        
        let runForward = SCNAction.moveBy(x: 0.0, y: 0.0, z: 90.0, duration: 2.0)
        
        // animate the 3d object
        letterANode.runAction(runForward)
        
        
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
//        let backGround = UIImage(named: "playground1")!
//        let backGroundImageView = UIImageView(image: backGround)
//        scnView.addSubview(backGroundImageView)
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
//        scnView.backgroundColor = UIColor.black
        
        // add a tap gesture recognizer
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
//        scnView.addGestureRecognizer(tapGesture)
    }
    
//    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
//        // retrieve the SCNView
//        let scnView = self.view as! SCNView
//        
//        // check what nodes are tapped
//        let p = gestureRecognize.location(in: scnView)
//        let hitResults = scnView.hitTest(p, options: [:])
//        // check that we clicked on at least one object
//        if hitResults.count > 0 {
//            // retrieved the first clicked object
//            let result: AnyObject = hitResults[0]
//            
//            // get its material
//            let material = result.node!.geometry!.firstMaterial!
//            
//            // highlight it
//            SCNTransaction.begin()
//            SCNTransaction.animationDuration = 0.5
//            
//            // on completion - unhighlight
//            SCNTransaction.completionBlock = {
//                SCNTransaction.begin()
//                SCNTransaction.animationDuration = 0.5
//                
//                material.emission.contents = UIColor.black
//                
//                SCNTransaction.commit()
//            }
//            
//            material.emission.contents = UIColor.red
//            
//            SCNTransaction.commit()
//        }
//    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
