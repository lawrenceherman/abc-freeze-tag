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
    var gameView = UIView()
    var startLabel: UILabel!
    var scnView: SCNView!
    
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
        
        scnView = self.view as! SCNView
        scnView.scene = scene
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.white
        scnView.autoenablesDefaultLighting = true
        
        loadGameView()
        
        
        
        
        
        
        
        
        
        
//        let runForward = SCNAction.moveBy(x: 0.0, y: 0.0, z: 185, duration: 2.0)
//        let runBackward = SCNAction.moveBy(x: 0.0, y: 0.0, z: -90.0, duration: 2.0)
        let runRight = SCNAction.moveBy(x: 100.00, y: 0, z: 0, duration: 2.0)
        let runLeft = SCNAction.moveBy(x: -200.00, y: 0, z: 0, duration: 2.0)
        let wait = SCNAction.wait(duration: 1.0)
//        let reverseRight = SCNAction.reversed(runRight)
        
        
        let presentLetter = SCNAction.move(to: SCNVector3(133, 3, 170), duration: 0.5)
        let moveToHome = SCNAction.move(to: SCNVector3(17, 50, 0), duration: 1.0)
//
//        let testActionRun = SCNAction.run { (<#SCNNode#>) in
//            <#code#>
//        }
//
//        let testCustomAction = SCNAction.customAction(duration: TimeInterval) { (<#SCNNode#>, <#CGFloat#>) in
//            <#code#>
//        }
//        bNodePlay.runAction(runRight, forKey: "runRightKey")
//        bNodePlay.runAction(runLeft)
        let testZAction = SCNAction.moveBy(x: 0, y: 0, z: 100, duration: 1.0)
        let testZAction2 = SCNAction.moveBy(x: 0, y: 0, z: -100, duration: 1.0)
        
        let zSequenceArray = [testZAction, testZAction2]
        let zSequence = SCNAction.sequence(zSequenceArray)
        let zRepeat = SCNAction.repeatForever(zSequence)
        
        aNodePlay.runAction(zRepeat)
//        let actionArray = [presentLetter, wait, moveToHome]
//        let sequence = SCNAction.sequence(actionArray)
//        bNodePlay.runAction(sequence)
        
// possibly use runAction with completion block to return to game
        
        print(bNodePlay.actionKeys)
        
    }
    
    
    
    
    func loadNodePlay() {
        
        aNodePlay = SCNNode(geometry: aGeo)
        aNodePlay.position = SCNVector3(140, 0, 0)
        scene.rootNode.addChildNode(aNodePlay)
        
        bNodePlay = SCNNode(geometry: bGeo)
        bNodePlay.position = SCNVector3(140, 0, 150)
        scene.rootNode.addChildNode(bNodePlay)
        
//        cNodePlay = SCNNode(geometry: cGeo)
//        cNodePlay.position = SCNVector3(133, 3, 170)
//        scene.rootNode.addChildNode(cNodePlay)
        
        
        
        
        
        
        
    }
    
    func loadNodeHome() {
        
        aNodeHome = SCNNode(geometry: aGeo)
        aNodeHome.position = SCNVector3(0, 50, 0)
        scene.rootNode.addChildNode(aNodeHome)
        
        bNodeHome = SCNNode(geometry: bGeo)
        bNodeHome.position = SCNVector3(17, 50, 0)
        scene.rootNode.addChildNode(bNodeHome)
        
        cNodeHome = SCNNode(geometry: cGeo)
        cNodeHome.position = SCNVector3(34, 50, 0)
        scene.rootNode.addChildNode(cNodeHome)
        
        dNodeHome = SCNNode(geometry: dGeo)
        dNodeHome.position = SCNVector3(51, 50, 0)
        scene.rootNode.addChildNode(dNodeHome)
        
        eNodeHome = SCNNode(geometry: eGeo)
        eNodeHome.position = SCNVector3(68, 50, 0)
        scene.rootNode.addChildNode(eNodeHome)
        
        fNodeHome = SCNNode(geometry: fGeo)
        fNodeHome.position = SCNVector3(85, 50, 0)
        scene.rootNode.addChildNode(fNodeHome)
        
        gNodeHome = SCNNode(geometry: gGeo)
        gNodeHome.position = SCNVector3(102, 50, 0)
        scene.rootNode.addChildNode(gNodeHome)
        
        hNodeHome = SCNNode(geometry: hGeo)
        hNodeHome.position = SCNVector3(119, 50, 0)
        scene.rootNode.addChildNode(hNodeHome)
        
        iNodeHome = SCNNode(geometry: iGeo)
        iNodeHome.position = SCNVector3(136, 50, 0)
        scene.rootNode.addChildNode(iNodeHome)
        
        jNodeHome = SCNNode(geometry: jGeo)
        jNodeHome.position = SCNVector3(153, 50, 0)
        scene.rootNode.addChildNode(jNodeHome)
        
        kNodeHome = SCNNode(geometry: kGeo)
        kNodeHome.position = SCNVector3(170, 50, 0)
        scene.rootNode.addChildNode(kNodeHome)
        
        lNodeHome = SCNNode(geometry: lGeo)
        lNodeHome.position = SCNVector3(187, 50, 0)
        scene.rootNode.addChildNode(lNodeHome)
        
        mNodeHome = SCNNode(geometry: mGeo)
        mNodeHome.position = SCNVector3(204, 50, 0)
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
    
    func loadGameView () {
        
        scnView.addSubview(gameView)
        
        gameView.translatesAutoresizingMaskIntoConstraints = false
        gameView.trailingAnchor.constraint(equalTo: scnView.trailingAnchor).isActive = true
        gameView.leadingAnchor.constraint(equalTo: scnView.leadingAnchor).isActive = true
        gameView.topAnchor.constraint(equalTo: scnView.topAnchor).isActive = true
        gameView.bottomAnchor.constraint(equalTo: scnView.bottomAnchor).isActive = true
        
        let testCGRect = CGRect(x: 100, y: 100, width: 100, height: 100)
        startLabel = UILabel(frame: testCGRect)
        startLabel.font = UIFont(name: "Arial", size: 50.0)
        startLabel.text = "START"
        startLabel.layer.masksToBounds = true
        startLabel.layer.cornerRadius = 20
        startLabel.layer.backgroundColor = UIColor.green.cgColor
        gameView.addSubview(startLabel)
        
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        startLabel.trailingAnchor.constraint(equalTo: gameView.trailingAnchor, constant: -75).isActive = true
        startLabel.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 50).isActive = true
        
        startLabel.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction(_:)))
        
        startLabel.addGestureRecognizer(tap)
        
    }
    
    @objc func tapFunction(_ sender:UITapGestureRecognizer) {
        print("tap working")
        scnView.stop(startLabel)
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
