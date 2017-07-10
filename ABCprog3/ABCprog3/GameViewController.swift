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
    var moveLeft = SCNAction.moveBy(x: -20.0, y: 0, z: 0, duration: 2.0)
    var moveRight = SCNAction.moveBy(x: 20.0, y: 0, z: 0, duration: 2.0)
    
    

    
    var aGeo, bGeo, cGeo, dGeo, eGeo, fGeo, gGeo, hGeo, iGeo,
    jGeo, kGeo, lGeo, mGeo, nGeo, oGeo, pGeo, qGeo, rGeo, sGeo,
    tGeo, uGeo, vGeo, wGeo, xGeo, yGeo, zGeo: Letter!
    
    
    
    var  aNodeFrozen, bNodeFrozen, cNodeFrozen, dNodeFrozen, eNodeFrozen, fNodeFrozen, gNodeFrozen,
    hNodeFrozen, iNodeFrozen, jNodeFrozen, kNodeFrozen, lNodeFrozen, mNodeFrozen, nNodeFrozen, oNodeFrozen,
    pNodeFrozen, qNodeFrozen, rNodeFrozen, sNodeFrozen, tNodeFrozen, uNodeFrozen, vNodeFrozen, wNodeFrozen,
    xNodeFrozen, yNodeFrozen, zNodeFrozen: LetterNode!
    
    var aNodeFree, bNodeFree, cNodeFree: LetterNode!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraAndLights()
        environment()
        loadGeometry()
        loadNodesFrozen()
        loadNodesFree()
        
        scnView = self.view as! SCNView
        scnView.scene = scene
        scnView.allowsCameraControl = false
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.blue
        scnView.autoenablesDefaultLighting = false
        
        loadGameView()
        
        let runForward = SCNAction.moveBy(x: 0.0, y: 0.0, z: 20, duration: 0.25)
        let runBackward = SCNAction.moveBy(x: 0.0, y: 0.0, z: -20.0, duration: 0.25)
        let runRight = SCNAction.moveBy(x: 20.00, y: 0, z: 0, duration: 0.25)
        let runLeft = SCNAction.moveBy(x: -20.00, y: 0, z: 0, duration: 0.25 )
        
        
        //
        
        ////
        //        let testCustomAction = SCNAction.customAction(duration: 4.0) { (node, time) in
        //            if time < 2.0 {
        //            node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        //            } else {
        //            node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        //            }
        //            node.runAction(<#T##action: SCNAction##SCNAction#>, completionHandler: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        //        }
        //        bNodePlay.runAction(runRight, forKey: "runRightKey")
        //        bNodePlay.runAction(runLeft)
        let testZAction = SCNAction.moveBy(x: 0, y: 0, z: 100, duration: 1.0)
        //        let testZAction2 = SCNAction.moveBy(x: 0, y: 0, z: -100, duration: 1.0)
        
       
        //        let zRepeat = SCNAction.repeatForever(zSequence)
        
        
        
        //        aNodePlay.runAction(testCustomAction)
        
        
        
        
        func runWild(_ node: LetterNode) {
            
            if node.hitTapped == false  {
            
            let x = arc4random_uniform(2)
            
            if x == 0 {
                if node.position.x > 240 {
                    node.runAction(runLeft, completionHandler: {
                        runWild(node)
                    })
                } else if node.position.x < 30 {
                    node.runAction(runRight, completionHandler: {
                        runWild(node)
                    })
                } else {
                    let i = arc4random_uniform(2)
                    if i == 0 {
                        node.runAction(runLeft, completionHandler: {
                            runWild(node)
                        })
                    }
                    
                    if i == 1 {
                        node.runAction(runRight, completionHandler: {
                            runWild(node)
                        })
                    }
                }
            }
            
            if x == 1 {
                if node.position.z < 80 {
                    node.runAction(runForward, completionHandler: {
                        runWild(node)
                    })
                } else if node.position.z > 175 {
                    node.runAction(runBackward, completionHandler: {
                        runWild(node)
                    })
                } else {
                    let i = arc4random_uniform(2)
                    
                    if i == 0 {
                        node.runAction(runForward, completionHandler: {
                            runWild(node)
                        })
                    }
                    
                    if i == 1 {
                        node.runAction(runBackward, completionHandler: {
                            runWild(node)
                        })
                    }
                }
                
                
            }
            }
        }
        
        runWild(aNodeFree)
        runWild(bNodeFree)
        runWild(cNodeFree)
        
        
        
        
        
//        print(bNodePlay.actionKeys)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
        
        
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        print("tap working")
        
        let tapCG = gestureRecognizer.location(in: scnView)
        
        let hitResults = scnView.hitTest(tapCG, options: [:])
        
        
        if let tappedNode = hitResults.first?.node as? LetterNode {
            
            
            if tappedNode.frozenPosition != nil {
                tappedNode.hitTapped = true
//                tappedNode.geometry?.firstMaterial?.diffuse.contents = UIColor.black
                let wait = SCNAction.wait(duration: 1.0)
                let presentLetter = SCNAction.move(to: SCNVector3(133, 3, 170), duration: 0.5)
                let moveToHome = SCNAction.move(to: tappedNode.frozenPosition!, duration: 1.0)
                let actionArray = [presentLetter, wait, moveToHome]
                let sequence = SCNAction.sequence(actionArray)
                tappedNode.runAction(sequence)
                
                
            }
            
        }
        
        
                
            
            
        }
        
//        if hitResults.count > 0 {
//
//            let result = hitResults[0]
//
//            let material = result.node.geometry!.firstMaterial!
//
//            SCNTransaction.begin()
//            SCNTransaction.animationDuration = 0.5
//
//            SCNTransaction.completionBlock = {
//                SCNTransaction.begin()
//                SCNTransaction.animationDuration = 0.5
//
//                material.emission.contents = UIColor.black
//                SCNTransaction.commit()
//
//            }
//
//            material.emission.contents = UIColor.red
//            SCNTransaction.commit()
//
//        }
        
    
    
    func loadNodesFree() {
        
        // TODO: create function to randomly generate starting position
        
        aNodeFree = LetterNode(geometry: aGeo, frozen: false)
        aNodeFree.position = SCNVector3(140, 0, 80)
        aNodeFree.frozenPosition = aNodeFrozen.position
        scene.rootNode.addChildNode(aNodeFree)
        
        bNodeFree = LetterNode(geometry: bGeo, frozen: false)
        bNodeFree.position = SCNVector3(140, 0, 150)
        bNodeFree.frozenPosition = bNodeFrozen.position
        scene.rootNode.addChildNode(bNodeFree)
        
        cNodeFree = LetterNode(geometry: cGeo, frozen: false)
        cNodeFree.position = SCNVector3(50, 0, 120)
        cNodeFree.frozenPosition = cNodeFrozen.position
        scene.rootNode.addChildNode(cNodeFree)
        
    }
    
    func loadNodesFrozen() {
        
        aNodeFrozen = LetterNode(geometry: aGeo, frozen: true)
        aNodeFrozen.position = SCNVector3(0, 50, 0)
        scene.rootNode.addChildNode(aNodeFrozen)
        
        bNodeFrozen = LetterNode(geometry: bGeo, frozen: true)
        bNodeFrozen.position = SCNVector3(17, 50, 0)
        scene.rootNode.addChildNode(bNodeFrozen)
        
        cNodeFrozen = LetterNode(geometry: cGeo, frozen: true)
        cNodeFrozen.position = SCNVector3(34, 50, 0)
        scene.rootNode.addChildNode(cNodeFrozen)
        
        dNodeFrozen = LetterNode(geometry: dGeo, frozen: true)
        dNodeFrozen.position = SCNVector3(51, 50, 0)
        scene.rootNode.addChildNode(dNodeFrozen)
        
        eNodeFrozen = LetterNode(geometry: eGeo, frozen: true)
        eNodeFrozen.position = SCNVector3(68, 50, 0)
        scene.rootNode.addChildNode(eNodeFrozen)
        
        fNodeFrozen = LetterNode(geometry: fGeo, frozen: true)
        fNodeFrozen.position = SCNVector3(85, 50, 0)
        scene.rootNode.addChildNode(fNodeFrozen)
        
        gNodeFrozen = LetterNode(geometry: gGeo, frozen: true)
        gNodeFrozen.position = SCNVector3(102, 50, 0)
        scene.rootNode.addChildNode(gNodeFrozen)
        
        hNodeFrozen = LetterNode(geometry: hGeo, frozen: true)
        hNodeFrozen.position = SCNVector3(119, 50, 0)
        scene.rootNode.addChildNode(hNodeFrozen)
        
        iNodeFrozen = LetterNode(geometry: iGeo, frozen: true)
        iNodeFrozen.position = SCNVector3(136, 50, 0)
        scene.rootNode.addChildNode(iNodeFrozen)
        
        jNodeFrozen = LetterNode(geometry: jGeo, frozen: true)
        jNodeFrozen.position = SCNVector3(153, 50, 0)
        scene.rootNode.addChildNode(jNodeFrozen)
        
        kNodeFrozen = LetterNode(geometry: kGeo, frozen: true)
        kNodeFrozen.position = SCNVector3(170, 50, 0)
        scene.rootNode.addChildNode(kNodeFrozen)
        
        lNodeFrozen = LetterNode(geometry: lGeo, frozen: true)
        lNodeFrozen.position = SCNVector3(187, 50, 0)
        scene.rootNode.addChildNode(lNodeFrozen)
        
        mNodeFrozen = LetterNode(geometry: mGeo, frozen: true)
        mNodeFrozen.position = SCNVector3(204, 50, 0)
        scene.rootNode.addChildNode(mNodeFrozen)
        
        nNodeFrozen = LetterNode(geometry: nGeo, frozen: true)
        nNodeFrozen.position = SCNVector3(0, 20, 0)
        scene.rootNode.addChildNode(nNodeFrozen)
        
        oNodeFrozen = LetterNode(geometry: oGeo, frozen: true)
        oNodeFrozen.position = SCNVector3(20, 20, 0)
        scene.rootNode.addChildNode(oNodeFrozen)
        
        pNodeFrozen = LetterNode(geometry: pGeo, frozen: true)
        pNodeFrozen.position = SCNVector3(40, 20, 0)
        scene.rootNode.addChildNode(pNodeFrozen)
        
        qNodeFrozen = LetterNode(geometry: qGeo, frozen: true)
        qNodeFrozen.position = SCNVector3(60, 20, 0)
        scene.rootNode.addChildNode(qNodeFrozen)
        
        rNodeFrozen = LetterNode(geometry: rGeo, frozen: true)
        rNodeFrozen.position = SCNVector3(80, 20, 0)
        scene.rootNode.addChildNode(rNodeFrozen)
        
        sNodeFrozen = LetterNode(geometry: sGeo, frozen: true)
        sNodeFrozen.position = SCNVector3(100, 20, 0)
        scene.rootNode.addChildNode(sNodeFrozen)
        
        tNodeFrozen = LetterNode(geometry: tGeo, frozen: true)
        tNodeFrozen.position = SCNVector3(120, 20, 0)
        scene.rootNode.addChildNode(tNodeFrozen)
        
        uNodeFrozen = LetterNode(geometry: uGeo, frozen: true)
        uNodeFrozen.position = SCNVector3(140, 20, 0)
        scene.rootNode.addChildNode(uNodeFrozen)
        
        vNodeFrozen = LetterNode(geometry: vGeo, frozen: true)
        vNodeFrozen.position = SCNVector3(160, 20, 0)
        scene.rootNode.addChildNode(vNodeFrozen)
        
        wNodeFrozen = LetterNode(geometry: wGeo, frozen: true)
        wNodeFrozen.position = SCNVector3(180, 20, 0)
        scene.rootNode.addChildNode(wNodeFrozen)
        
        xNodeFrozen = LetterNode(geometry: xGeo, frozen: true)
        xNodeFrozen.position = SCNVector3(200, 20, 0)
        scene.rootNode.addChildNode(xNodeFrozen)
        
        yNodeFrozen = LetterNode(geometry: yGeo, frozen: true)
        yNodeFrozen.position = SCNVector3(220, 20, 0)
        scene.rootNode.addChildNode(yNodeFrozen)
        
        zNodeFrozen = LetterNode(geometry: zGeo, frozen: true)
        zNodeFrozen.position = SCNVector3(240, 20, 0)
        scene.rootNode.addChildNode(zNodeFrozen)
        
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
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction(_:)))
        
//        startLabel.addGestureRecognizer(tap)
        
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
    
    
    
    
}
