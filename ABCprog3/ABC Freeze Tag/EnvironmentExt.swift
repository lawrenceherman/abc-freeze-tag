//
//  EnvironmentExt.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 7/10/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SceneKit

extension GameViewController {
    
    func cameraAndLights () {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.camera?.xFov = 80
        let radians = degreesToRadians(degrees: -16)
        let eulerVector = SCNVector3Make(radians, 0, 0)
        cameraNode.eulerAngles = eulerVector
        cameraNode.position = SCNVector3(x: 140, y: 20, z: 190)
        cameraNode.camera?.zFar = 200
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 140, y: 100, z: 200)
        scene.rootNode.addChildNode(lightNode)
        
        //        let directionalLight = SCNNode()
        //        directionalLight.light = SCNLight()
        //        directionalLight.light!.type = .directional
        //        directionalLight.position = SCNVector3(x: 9, y: 10, z: 100)
        //        scene.rootNode.addChildNode(directionalLight)
        
        //        let ambientLightNode = SCNNode()
        //        ambientLightNode.light = SCNLight()
        //        ambientLightNode.light!.type = .ambient
        //        // ambientLightNode.light!.color = UIColor.darkGray
        //        scene.rootNode.addChildNode(ambientLightNode)
        
    }
    
    func environment () {
        let floor = SCNFloor()
        let grass1 = SCNMaterial()
        grass1.diffuse.contents = UIImage(named: "grass2")
        grass1.diffuse.wrapS = .repeat
        grass1.diffuse.wrapT = .repeat
        floor.reflectivity = 0
        floor.firstMaterial = grass1
        let floorNode = SCNNode(geometry: floor)
        let floorPhysics = SCNPhysicsBody.static()
        floorNode.physicsBody = floorPhysics
        scene.rootNode.addChildNode(floorNode)
        
        
    }
    
    
}
