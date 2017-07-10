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
    
    // have to figure out a way to share these Geos
    
    var aGeoF, bGeoF, cGeoF, dGeoF, eGeoF, fGeoF, gGeoF, hGeoF, iGeoF,
    jGeoF, kGeoF, lGeoF, mGeoF, nGeoF, oGeoF, pGeoF, qGeoF, rGeoF, sGeoF,
    tGeoF, uGeoF, vGeoF, wGeoF, xGeoF, yGeoF, zGeoF: Letter!
    
    
    
    var  aNodeFrozen, bNodeFrozen, cNodeFrozen, dNodeFrozen, eNodeFrozen, fNodeFrozen, gNodeFrozen,
    hNodeFrozen, iNodeFrozen, jNodeFrozen, kNodeFrozen, lNodeFrozen, mNodeFrozen, nNodeFrozen, oNodeFrozen, pNodeFrozen, qNodeFrozen, rNodeFrozen, sNodeFrozen, tNodeFrozen, uNodeFrozen, vNodeFrozen, wNodeFrozen,
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
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.blue
        scnView.autoenablesDefaultLighting = false
        loadGameView()

    }
    
    
    
    
    
    
    
    func runWild(_ node: LetterNode) {
        
        let runForward = SCNAction.moveBy(x: 0.0, y: 0.0, z: 20, duration: 0.25)
        let runBackward = SCNAction.moveBy(x: 0.0, y: 0.0, z: -20.0, duration: 0.25)
        let runRight = SCNAction.moveBy(x: 20.00, y: 0, z: 0, duration: 0.25)
        let runLeft = SCNAction.moveBy(x: -20.00, y: 0, z: 0, duration: 0.25 )
        
        if node.hitTapped == false  {
            
            let x = arc4random_uniform(2)
            
            if x == 0 {
                if node.position.x > 240 {
                    node.runAction(runLeft, completionHandler: {
                        self.runWild(node)
                    })
                } else if node.position.x < 30 {
                    node.runAction(runRight, completionHandler: {
                        self.runWild(node)
                    })
                } else {
                    let i = arc4random_uniform(2)
                    if i == 0 {
                        node.runAction(runLeft, completionHandler: {
                            self.runWild(node)
                        })
                    }
                    
                    if i == 1 {
                        node.runAction(runRight, completionHandler: {
                            self.runWild(node)
                        })
                    }
                }
            }
            
            if x == 1 {
                if node.position.z < 80 {
                    node.runAction(runForward, completionHandler: {
                        self.runWild(node)
                    })
                } else if node.position.z > 175 {
                    node.runAction(runBackward, completionHandler: {
                        self.runWild(node)
                    })
                } else {
                    let i = arc4random_uniform(2)
                    
                    if i == 0 {
                        node.runAction(runForward, completionHandler: {
                            self.runWild(node)
                        })
                    }
                    
                    if i == 1 {
                        node.runAction(runBackward, completionHandler: {
                            self.runWild(node)
                        })
                    }
                }
                
            }
        }
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLetterTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
        
        
    }
    
    @objc func handleLetterTap(_ gestureRecognizer: UITapGestureRecognizer) {
        print("tap working")
        
        let tapCG = gestureRecognizer.location(in: scnView)
        
        let hitResults = scnView.hitTest(tapCG, options: [:])
        
        
        if let tappedNode = hitResults.first?.node as? LetterNode {
            
            
            if tappedNode.frozenPosition != nil {
                tappedNode.hitTapped = true
                
                let wait = SCNAction.wait(duration: 1.0)
                let presentLetter = SCNAction.move(to: SCNVector3(133, 3, 170), duration: 0.5)
                let moveToHome = SCNAction.move(to: tappedNode.frozenPosition!, duration: 1.0)
                let actionArray = [presentLetter, wait, moveToHome]
                let sequence = SCNAction.sequence(actionArray)
                tappedNode.runAction(sequence)
                
                
            }
        }
        
    }
    
    func loadNodesFree() {
        
        // TODO: create function to randomly generate starting position
        
        aNodeFree = LetterNode(geometry: aGeo, frozen: false)
        aNodeFree.position = SCNVector3(140, 0, 80)
        aNodeFree.frozenPosition = aNodeFrozen.position
        let physicsBody = SCNPhysicsBody.dynamic()
        aNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(aNodeFree)
        
        bNodeFree = LetterNode(geometry: bGeo, frozen: false)
        bNodeFree.position = SCNVector3(140, 0, 150)
        bNodeFree.frozenPosition = bNodeFrozen.position
        scene.rootNode.addChildNode(bNodeFree)
        
        cNodeFree = LetterNode(geometry: cGeo, frozen: false)
        cNodeFree.position = SCNVector3(140, 0, 120)
        cNodeFree.frozenPosition = cNodeFrozen.position
        cNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(cNodeFree)
        
    }
    
    func loadNodesFrozen() {
        
        aNodeFrozen = LetterNode(geometry: aGeoF, frozen: true)
        aNodeFrozen.position = SCNVector3(0, 50, 0)
        scene.rootNode.addChildNode(aNodeFrozen)
        
        bNodeFrozen = LetterNode(geometry: bGeoF, frozen: true)
        bNodeFrozen.position = SCNVector3(17, 50, 0)
        scene.rootNode.addChildNode(bNodeFrozen)
        
        cNodeFrozen = LetterNode(geometry: cGeoF, frozen: true)
        cNodeFrozen.position = SCNVector3(34, 50, 0)
        scene.rootNode.addChildNode(cNodeFrozen)
        
        dNodeFrozen = LetterNode(geometry: dGeoF, frozen: true)
        dNodeFrozen.position = SCNVector3(51, 50, 0)
        scene.rootNode.addChildNode(dNodeFrozen)
        
        eNodeFrozen = LetterNode(geometry: eGeoF, frozen: true)
        eNodeFrozen.position = SCNVector3(68, 50, 0)
        scene.rootNode.addChildNode(eNodeFrozen)
        
        fNodeFrozen = LetterNode(geometry: fGeoF, frozen: true)
        fNodeFrozen.position = SCNVector3(85, 50, 0)
        scene.rootNode.addChildNode(fNodeFrozen)
        
        gNodeFrozen = LetterNode(geometry: gGeoF, frozen: true)
        gNodeFrozen.position = SCNVector3(102, 50, 0)
        scene.rootNode.addChildNode(gNodeFrozen)
        
        hNodeFrozen = LetterNode(geometry: hGeoF, frozen: true)
        hNodeFrozen.position = SCNVector3(119, 50, 0)
        scene.rootNode.addChildNode(hNodeFrozen)
        
        iNodeFrozen = LetterNode(geometry: iGeoF, frozen: true)
        iNodeFrozen.position = SCNVector3(136, 50, 0)
        scene.rootNode.addChildNode(iNodeFrozen)
        
        jNodeFrozen = LetterNode(geometry: jGeoF, frozen: true)
        jNodeFrozen.position = SCNVector3(153, 50, 0)
        scene.rootNode.addChildNode(jNodeFrozen)
        
        kNodeFrozen = LetterNode(geometry: kGeoF, frozen: true)
        kNodeFrozen.position = SCNVector3(170, 50, 0)
        scene.rootNode.addChildNode(kNodeFrozen)
        
        lNodeFrozen = LetterNode(geometry: lGeoF, frozen: true)
        lNodeFrozen.position = SCNVector3(187, 50, 0)
        scene.rootNode.addChildNode(lNodeFrozen)
        
        mNodeFrozen = LetterNode(geometry: mGeoF, frozen: true)
        mNodeFrozen.position = SCNVector3(204, 50, 0)
        scene.rootNode.addChildNode(mNodeFrozen)
        
        nNodeFrozen = LetterNode(geometry: nGeoF, frozen: true)
        nNodeFrozen.position = SCNVector3(221, 50, 0)
        scene.rootNode.addChildNode(nNodeFrozen)
        
        oNodeFrozen = LetterNode(geometry: oGeoF, frozen: true)
        oNodeFrozen.position = SCNVector3(238, 50, 0)
        scene.rootNode.addChildNode(oNodeFrozen)
        
        pNodeFrozen = LetterNode(geometry: pGeoF, frozen: true)
        pNodeFrozen.position = SCNVector3(255, 50, 0)
        scene.rootNode.addChildNode(pNodeFrozen)
        
        qNodeFrozen = LetterNode(geometry: qGeoF, frozen: true)
        qNodeFrozen.position = SCNVector3(40, 20, 0)
        scene.rootNode.addChildNode(qNodeFrozen)
        
        rNodeFrozen = LetterNode(geometry: rGeoF, frozen: true)
        rNodeFrozen.position = SCNVector3(60, 20, 0)
        scene.rootNode.addChildNode(rNodeFrozen)
        
        sNodeFrozen = LetterNode(geometry: sGeoF, frozen: true)
        sNodeFrozen.position = SCNVector3(80, 20, 0)
        scene.rootNode.addChildNode(sNodeFrozen)
        
        tNodeFrozen = LetterNode(geometry: tGeoF, frozen: true)
        tNodeFrozen.position = SCNVector3(100, 20, 0)
        scene.rootNode.addChildNode(tNodeFrozen)
        
        uNodeFrozen = LetterNode(geometry: uGeoF, frozen: true)
        uNodeFrozen.position = SCNVector3(120, 20, 0)
        scene.rootNode.addChildNode(uNodeFrozen)
        
        vNodeFrozen = LetterNode(geometry: vGeoF, frozen: true)
        vNodeFrozen.position = SCNVector3(140, 20, 0)
        scene.rootNode.addChildNode(vNodeFrozen)
        
        wNodeFrozen = LetterNode(geometry: wGeoF, frozen: true)
        wNodeFrozen.position = SCNVector3(160, 20, 0)
        scene.rootNode.addChildNode(wNodeFrozen)
        
        xNodeFrozen = LetterNode(geometry: xGeoF, frozen: true)
        xNodeFrozen.position = SCNVector3(180, 20, 0)
        scene.rootNode.addChildNode(xNodeFrozen)
        
        yNodeFrozen = LetterNode(geometry: yGeoF, frozen: true)
        yNodeFrozen.position = SCNVector3(200, 20, 0)
        scene.rootNode.addChildNode(yNodeFrozen)
        
        zNodeFrozen = LetterNode(geometry: zGeoF, frozen: true)
        zNodeFrozen.position = SCNVector3(220, 20, 0)
        scene.rootNode.addChildNode(zNodeFrozen)
        
    }
    
    
    

    
    
    
    func loadGameView () {
        
        scnView.addSubview(gameView)
        
        gameView.translatesAutoresizingMaskIntoConstraints = false
        gameView.trailingAnchor.constraint(equalTo: scnView.trailingAnchor).isActive = true
        gameView.leadingAnchor.constraint(equalTo: scnView.leadingAnchor).isActive = true
        gameView.topAnchor.constraint(equalTo: scnView.topAnchor).isActive = true
        gameView.bottomAnchor.constraint(equalTo: scnView.bottomAnchor).isActive = true
        
        //        let testCGRect = CGRect(x: 100, y: 100, width: 5, height: 5)
        
        startLabel = UILabel( )
        gameView.addSubview(startLabel)
        
        startLabel.adjustsFontSizeToFitWidth = true
        
        startLabel.font = UIFont(name: "Arial", size: 36.0 )
        startLabel.text = "START"
        startLabel.layer.masksToBounds = true
        //        startLabel.layer.cornerRadius = 125
        startLabel.layer.backgroundColor = UIColor.green.cgColor
        
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        startLabel.layer.cornerRadius = startLabel.frame.width/2
        
        startLabel.widthAnchor.constraint(equalTo: startLabel.heightAnchor, multiplier: 0.0)
        startLabel.trailingAnchor.constraint(equalTo: gameView.trailingAnchor, constant: -50).isActive = true
        startLabel.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 150).isActive = true
        
        
        startLabel.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleStartTap(_:)))
        //
        startLabel.addGestureRecognizer(tap)
        
    }
    
    @objc func handleStartTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        aNodeFrozen.isHidden = false
        bNodeFrozen.isHidden = false
        cNodeFrozen.isHidden = false
        
        runWild(aNodeFree)
        runWild(bNodeFree)
        runWild(cNodeFree)
        
    }
    
    func degreesToRadians(degrees: Float) -> Float {
        return degrees * Float.pi / 180
    }
    
    func radiansToDegress(radians: Float) -> Float {
        return radians * 180 / Float.pi
    }
    
    
}
