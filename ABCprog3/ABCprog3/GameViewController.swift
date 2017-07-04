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
    
    var aNodePlay, bNodePlay, cNodePlay: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraAndLights()
        environment()
        loadGeometry()
        loadNodeHome()
        loadNodePlay()
        
        
        
        
        
        
        
        
        let scnView = self.view as! SCNView
        scnView.scene = scene
        scnView.allowsCameraControl = false
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.white
        
        let gameView = UIView()
        
        
        let testCGRect = CGRect(x: 100, y: 100, width: 100, height: 100)
        let testLabel = UILabel(frame: testCGRect)
        
        testLabel.font = UIFont(name: "Ariel", size: 36.0)
        testLabel.text = "hello"
        gameView.addSubview(testLabel)
        
        scnView.addSubview(gameView)
        
                let runForward = SCNAction.moveBy(x: 0.0, y: 0.0, z: 185, duration: 2.0)
                let runBackward = SCNAction.moveBy(x: 0.0, y: 0.0, z: -90.0, duration: 2.0)
                let runRight = SCNAction.moveBy(x: 260.00, y: 0, z: 0, duration: 2.0)
                let runLeft = SCNAction.move(by: SCNVector3(x: -100, y:0, z:0), duration: 1.0)
        bNodePlay.runAction(runRight)
        aNodePlay.runAction(runRight)
        cNodePlay.runAction(runRight)
        
//                let actionArray = [runForward, runRight]
//                let sequence = SCNAction.sequence(actionArray)
        
        
    }
    
    func loadNodePlay() {
        
        aNodePlay = SCNNode(geometry: aGeo)
        aNodePlay.position = SCNVector3(0, 0, 175)
        scene.rootNode.addChildNode(aNodePlay)
        
        bNodePlay = SCNNode(geometry: bGeo)
        bNodePlay.position = SCNVector3(0, 0, 70)
        scene.rootNode.addChildNode(bNodePlay)
        
        cNodePlay = SCNNode(geometry: cGeo)
        cNodePlay.position = SCNVector3(0, 0, 120)
        scene.rootNode.addChildNode(cNodePlay)
        
        
        
        
        
        
        
    }
    
    func loadNodeHome() {
        
        aNodeHome = SCNNode(geometry: aGeo)
        aNodeHome.position = SCNVector3(0, 50, 0)
        scene.rootNode.addChildNode(aNodeHome)
        
        bNodeHome = SCNNode(geometry: bGeo)
        bNodeHome.position = SCNVector3(20, 50, 0)
        scene.rootNode.addChildNode(bNodeHome)
        
        cNodeHome = SCNNode(geometry: cGeo)
        cNodeHome.position = SCNVector3(40, 50, 0)
        scene.rootNode.addChildNode(cNodeHome)
        
        dNodeHome = SCNNode(geometry: dGeo)
        dNodeHome.position = SCNVector3(60, 50, 0)
        scene.rootNode.addChildNode(dNodeHome)
        
        eNodeHome = SCNNode(geometry: eGeo)
        eNodeHome.position = SCNVector3(80, 50, 0)
        scene.rootNode.addChildNode(eNodeHome)
        
        fNodeHome = SCNNode(geometry: fGeo)
        fNodeHome.position = SCNVector3(100, 50, 0)
        scene.rootNode.addChildNode(fNodeHome)
        
        gNodeHome = SCNNode(geometry: gGeo)
        gNodeHome.position = SCNVector3(120, 50, 0)
        scene.rootNode.addChildNode(gNodeHome)
        
        hNodeHome = SCNNode(geometry: hGeo)
        hNodeHome.position = SCNVector3(140, 50, 0)
        scene.rootNode.addChildNode(hNodeHome)
        
        iNodeHome = SCNNode(geometry: iGeo)
        iNodeHome.position = SCNVector3(160, 50, 0)
        scene.rootNode.addChildNode(iNodeHome)
        
        jNodeHome = SCNNode(geometry: jGeo)
        jNodeHome.position = SCNVector3(180, 50, 0)
        scene.rootNode.addChildNode(jNodeHome)
        
        kNodeHome = SCNNode(geometry: kGeo)
        kNodeHome.position = SCNVector3(200, 50, 0)
        scene.rootNode.addChildNode(kNodeHome)
        
        lNodeHome = SCNNode(geometry: lGeo)
        lNodeHome.position = SCNVector3(220, 50, 0)
        scene.rootNode.addChildNode(lNodeHome)
        
        mNodeHome = SCNNode(geometry: mGeo)
        mNodeHome.position = SCNVector3(240, 50, 0)
        scene.rootNode.addChildNode(mNodeHome)
        
        nNodeHome = SCNNode(geometry: nGeo)
        nNodeHome.position = SCNVector3(0, 20, 0)
        scene.rootNode.addChildNode(nNodeHome)
        
        oNodeHome = SCNNode(geometry: oGeo)
        oNodeHome.position = SCNVector3(20, 20, 0)
        scene.rootNode.addChildNode(oNodeHome)
        
        pNodeHome = SCNNode(geometry: pGeo)
        pNodeHome.position = SCNVector3(40, 20, 0)
        scene.rootNode.addChildNode(pNodeHome)
        
        qNodeHome = SCNNode(geometry: qGeo)
        qNodeHome.position = SCNVector3(60, 20, 0)
        scene.rootNode.addChildNode(qNodeHome)
        
        rNodeHome = SCNNode(geometry: rGeo)
        rNodeHome.position = SCNVector3(80, 20, 0)
        scene.rootNode.addChildNode(rNodeHome)
        
        sNodeHome = SCNNode(geometry: sGeo)
        sNodeHome.position = SCNVector3(100, 20, 0)
        scene.rootNode.addChildNode(sNodeHome)
        
        tNodeHome = SCNNode(geometry: tGeo)
        tNodeHome.position = SCNVector3(120, 20, 0)
        scene.rootNode.addChildNode(tNodeHome)
        
        uNodeHome = SCNNode(geometry: uGeo)
        uNodeHome.position = SCNVector3(140, 20, 0)
        scene.rootNode.addChildNode(uNodeHome)
        
        vNodeHome = SCNNode(geometry: vGeo)
        vNodeHome.position = SCNVector3(160, 20, 0)
        scene.rootNode.addChildNode(vNodeHome)
        
        wNodeHome = SCNNode(geometry: wGeo)
        wNodeHome.position = SCNVector3(180, 20, 0)
        scene.rootNode.addChildNode(wNodeHome)
        
        xNodeHome = SCNNode(geometry: xGeo)
        xNodeHome.position = SCNVector3(200, 20, 0)
        scene.rootNode.addChildNode(xNodeHome)
        
        yNodeHome = SCNNode(geometry: yGeo)
        yNodeHome.position = SCNVector3(220, 20, 0)
        scene.rootNode.addChildNode(yNodeHome)
        
        zNodeHome = SCNNode(geometry: zGeo)
        zNodeHome.position = SCNVector3(240, 20, 0)
        scene.rootNode.addChildNode(zNodeHome)
        
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
        oGeo = Letter(letter: "O")
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
        let radians = degreesToRadians(degrees: -16)
        let eulerVector = SCNVector3Make(radians, 0, 0)
        cameraNode.eulerAngles = eulerVector
        cameraNode.position = SCNVector3(x: 140, y: 18, z: 190)
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
            self.font = UIFont.init(name: "Arial", size: 18.0)
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
    
    
    
    
    //        letterANode.runAction(sequence)
    //     letterANode.runAction(sequence)
    //        letterANode.runAction(runForward)
    //        letterANode.runAction(runBackward)
    
    
    // add a tap gesture recognizer
    //        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    //        scnView.addGestureRecognizer(tapGesture)
    
    
}
