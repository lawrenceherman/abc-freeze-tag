//
//  EnvironmentExt.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 7/10/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SceneKit

extension GameScene {
    
    func degreesToRadians(degrees: Float) -> Float {
        return degrees * Float.pi / 180
    }
    
    func radiansToDegress(radians: Float) -> Float {
        return radians * 180 / Float.pi
    }
    
    func loadCameraAndLights () {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        self.rootNode.addChildNode(cameraNode)
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
        self.rootNode.addChildNode(lightNode)
    }
    
    func loadFloor () {
        let floor = SCNFloor()
        let grass1 = SCNMaterial()
        grass1.diffuse.contents = UIImage(named: "grass2")
        grass1.diffuse.wrapS = .repeat
        grass1.diffuse.wrapT = .repeat
        floor.reflectivity = 0
        floor.firstMaterial = grass1
        floorNode = SCNNode(geometry: floor)
        let floorPhysics = SCNPhysicsBody.static()
        floorNode.physicsBody = floorPhysics
        self.rootNode.addChildNode(floorNode)
    }
    
    func loadSchool() {
        let schoolImage = SCNMaterial()
        schoolImage.diffuse.contents = UIImage(named: "school.png")
        schoolGeo = SCNPlane(width: 120, height: 70)
        schoolGeo.firstMaterial = schoolImage
        schoolNode = SCNNode(geometry: schoolGeo)
        self.rootNode.addChildNode(schoolNode)
        schoolNode.position = SCNVector3Make(150, 32, 0)
    }
}
