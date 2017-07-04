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
    
    let scene = SCNScene()
    var aGeo, bGeo, cGeo, dGeo, eGeo, fGeo, gGeo, hGeo, iGeo,
    jGeo, kGeo, lGeo, mGeo, nGeo, oGeo, pGeo, qGeo, rGeo, sGeo,
    tGeo, uGeo, vGeo, wGeo, xGeo, yGeo, zGeo: Letter!
    
    var aNodeHome, bNodeHome, cNodeHome, dNodeHome, eNodeHome, fNodeHome, gNodeHome,
    hNodeHome, iNodeHome, jNodeHome, kNodeHome, lNodeHome, mNodeHome, nNodeHome, oNodeHome,
    pNodeHome, qNodeHome, rNodeHome, sNodeHome, tNodeHome, uNodeHome, vNodeHome, wNodeHome,
    xNodeHome, yNodeHome, zNodeHome: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraAndLights()
        environment()
        loadGeometry()
        loadNodeHome()
        loadNodePlay()
        
        
        
        
        
        
        
//        letterAHome.position = SCNVector3(0, 50, 0)
//        scene.rootNode.addChildNode(letterAHome)
//        let letterAPlay = SCNNode(geometry: letterA)
//        letterAPlay.position = SCNVector3(100, 0, 150)
//        scene.rootNode.addChildNode(letterAPlay)
////
//        let letterBHome = SCNNode(geometry: letterB)
//        letterBHome.position = SCNVector3(270, 50, 0)
//        scene.rootNode.addChildNode(letterBHome)
        
        let scnView = self.view as! SCNView
        scnView.scene = scene
        scnView.allowsCameraControl = false
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.lightGray
        
        let gameView = UIView()
        
        
        let testCGRect = CGRect(x: 100, y: 100, width: 100, height: 100)
        let testLabel = UILabel(frame: testCGRect)
        
        testLabel.font = UIFont(name: "Ariel", size: 36.0)
        testLabel.text = "hello"
        gameView.addSubview(testLabel)
        
        
        
        scnView.addSubview(gameView)
        
        
    }
    
    func loadNodePlay() {
        
        
        
        
        
        
        
    }
    
    func loadNodeHome() {
        
        aNodeHome = SCNNode(geometry: aGeo)
        aNodeHome.position = SCNVector3(0, 40, 0)
        scene.rootNode.addChildNode(aNodeHome)
        
        bNodeHome = SCNNode(geometry: bGeo)
        bNodeHome.position = SCNVector3(20, 40, 0)
        scene.rootNode.addChildNode(bNodeHome)
        
        cNodeHome = SCNNode(geometry: cGeo)
        cNodeHome.position = SCNVector3(40, 40, 0)
        scene.rootNode.addChildNode(cNodeHome)
        
        dNodeHome = SCNNode(geometry: dGeo)
        eNodeHome = SCNNode(geometry: eGeo)
        fNodeHome = SCNNode(geometry: fGeo)
        gNodeHome = SCNNode(geometry: gGeo)
        hNodeHome = SCNNode(geometry: hGeo)
        iNodeHome = SCNNode(geometry: iGeo)
        jNodeHome = SCNNode(geometry: jGeo)
        kNodeHome = SCNNode(geometry: kGeo)
        lNodeHome = SCNNode(geometry: lGeo)
        mNodeHome = SCNNode(geometry: mGeo)
        nNodeHome = SCNNode(geometry: nGeo)
        oNodeHome = SCNNode(geometry: oGeo)
        pNodeHome = SCNNode(geometry: pGeo)
        qNodeHome = SCNNode(geometry: qGeo)
        rNodeHome = SCNNode(geometry: rGeo)
        sNodeHome = SCNNode(geometry: sGeo)
        tNodeHome = SCNNode(geometry: tGeo)
        uNodeHome = SCNNode(geometry: uGeo)
        vNodeHome = SCNNode(geometry: vGeo)
        wNodeHome = SCNNode(geometry: wGeo)
        xNodeHome = SCNNode(geometry: xGeo)
        yNodeHome = SCNNode(geometry: yGeo)
        zNodeHome = SCNNode(geometry: zGeo)
        
    }
    
    func loadGeometry() {
        
        aGeo = Letter(letter: "A")
        bGeo = Letter(letter: "B")
        cGeo = Letter(letter: "C")
        dGeo = Letter(letter: "D")
        eGeo = Letter(letter: "E")
        fGeo = Letter(letter: "F")
        gGeo = Letter(letter: "G")
        hGeo = Letter(letter: "H")
        iGeo = Letter(letter: "I")
        jGeo = Letter(letter: "J")
        kGeo = Letter(letter: "K")
        lGeo = Letter(letter: "L")
        mGeo = Letter(letter: "M")
        nGeo = Letter(letter: "N")
        nGeo = Letter(letter: "O")
        pGeo = Letter(letter: "P")
        qGeo = Letter(letter: "Q")
        rGeo = Letter(letter: "R")
        sGeo = Letter(letter: "S")
        tGeo = Letter(letter: "T")
        uGeo = Letter(letter: "U")
        vGeo = Letter(letter: "V")
        wGeo = Letter(letter: "W")
        xGeo = Letter(letter: "X")
        yGeo = Letter(letter: "Y")
        zGeo = Letter(letter: "Z")
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
        scene.rootNode.addChildNode(floorNode)
        
        //        scene.background.contents = UIImage(named: "playground2")
        
    }
    
    func cameraAndLights () {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.camera?.xFov = 80
        let radians = degreesToRadians(degrees: -15)
        let eulerVector = SCNVector3Make(radians, 0, 0)
        cameraNode.eulerAngles = eulerVector
        cameraNode.position = SCNVector3(x: 140, y: 15, z: 190)
        cameraNode.camera?.zFar = 200
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 30, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        let directionalLight = SCNNode()
        directionalLight.light = SCNLight()
        directionalLight.light!.type = .directional
        directionalLight.position = SCNVector3(x: 9, y: 10, z: 100)
        scene.rootNode.addChildNode(directionalLight)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        // ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
    }
    
    class Letter: SCNText {
        
        init(letter: String) {
            super.init()
            self.string = letter
            self.extrusionDepth = 2.0
            self.font = UIFont.init(name: "Arial", size: 16.0)
            self.flatness = 0
            
            switch letter {
            case "F", "D", "K", "P", "T", "Y":
                self.firstMaterial?.diffuse.contents = UIColor.red
            case "B", "G", "L", "Q", "V":
                self.firstMaterial?.diffuse.contents = UIColor.blue
            case "C", "H", "M", "R", "W", "Z":
                self.firstMaterial?.diffuse.contents = UIColor.yellow
            case "A", "E", "I", "O", "U":
                self.firstMaterial?.diffuse.contents = UIColor.green
            case "J", "N", "S", "X":
                self.firstMaterial?.diffuse.contents = UIColor.orange
            default:
                self.firstMaterial?.diffuse.contents = UIColor.red
            }
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
    
    
    func degreesToRadians(degrees: Float) -> Float {
        return degrees * Float.pi / 180
    }
    
    func radiansToDegress(radians: Float) -> Float {
        return radians * 180 / Float.pi
    }
    
    
    
    
    
    
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            return .allButUpsideDown
//        } else {
//            return .all
//        }
//    }
    
    
    //        let runForward = SCNAction.moveBy(x: 0.0, y: 0.0, z: 185, duration: 2.0)
    //        let runBackward = SCNAction.moveBy(x: 0.0, y: 0.0, z: -90.0, duration: 2.0)
    //        let runRight = SCNAction.moveBy(x: 100.00, y: 0, z: 0, duration: 1.0)
    //        let runLeft = SCNAction.move(by: SCNVector3(x: -100, y:0, z:0), duration: 1.0)
    //
    //        let actionArray = [runForward, runRight]
    //
    //        let sequence = SCNAction.sequence(actionArray)
    
    //        letterANode.runAction(sequence)
    //     letterANode.runAction(sequence)
    //        letterANode.runAction(runForward)
    //        letterANode.runAction(runBackward)
    
    
    // add a tap gesture recognizer
    //        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    //        scnView.addGestureRecognizer(tapGesture)
    
    
}
