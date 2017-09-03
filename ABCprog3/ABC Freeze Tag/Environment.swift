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
        let pitchRadians = degreesToRadians(degrees: -16)
        let eulerVector = SCNVector3Make(pitchRadians, 0, 0)
        cameraNode.eulerAngles = eulerVector
        cameraNode.position = SCNVector3(x: 140, y: 20, z: 190)
        cameraNode.camera?.zFar = 250
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 140, y: 50, z: 190)
        self.rootNode.addChildNode(lightNode)
        
        let sunLightNode = SCNNode()
        sunLightNode.light = SCNLight()
        sunLightNode.light?.type = .directional
        self.rootNode.addChildNode(sunLightNode)
        
        
//        let lightNode2 = SCNNode()
//        lightNode2.light = SCNLight()
//        lightNode2.light?.type = .ambient
//        lightNode2.light?.intensity = 200
//        self.rootNode.addChildNode(lightNode2)
        
    
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
        schoolNode.position = SCNVector3Make(-30, 32, 190)
        schoolNode.eulerAngles.y = degreesToRadians(degrees: 90)
    }
    
    func loadPlayground() {
        let playgroundImage = SCNMaterial()
        playgroundImage.diffuse.contents = UIImage(named: "playground.png")
        playgroundGeo = SCNPlane(width: 120, height: 70)
        playgroundGeo.firstMaterial = playgroundImage
        playgroundNode = SCNNode(geometry: playgroundGeo)
        self.rootNode.addChildNode((playgroundNode))
        playgroundNode.position = SCNVector3(300, 35, 190)
        playgroundNode.eulerAngles.y = degreesToRadians(degrees: -90)
    }
    
    func loadSun() {
        let sunImage = SCNMaterial()
        sunImage.diffuse.contents = UIImage(named: "singleSun1.png")
        sunGeo = SCNPlane(width: 75, height: 75)
        sunGeo.firstMaterial = sunImage
        sunNode = SCNNode(geometry: sunGeo)
        self.rootNode.addChildNode(sunNode)
        sunNode.position = SCNVector3(35, 50, 340)
        sunNode.eulerAngles.y = degreesToRadians(degrees: 130)
    }
    
    func loadTree() {
        let treeImage = SCNMaterial()
        treeImage.diffuse.contents = UIImage(named: "singleTree1.png")
        treeGeo = SCNPlane(width: 50, height: 50)
        treeGeo.firstMaterial = treeImage
        treeNode = SCNNode(geometry: treeGeo)
        self.rootNode.addChildNode(treeNode)
        treeNode.position = SCNVector3(180, 32, 290)
        treeNode.eulerAngles.y = degreesToRadians(degrees: -180)
    }
}
