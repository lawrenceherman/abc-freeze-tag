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
    let gameView = UIView()
    var startLabel: UILabel!
    var pauseLabel: UILabel!
    
    var scnView: SCNView!
    var pauseBool: Bool = true
    var startTapBool: Bool = true
    
    
    var aGeo, bGeo, cGeo: Letter!
    
//    dGeo, eGeo, fGeo, gGeo, hGeo, iGeo,
//    jGeo, kGeo, lGeo, mGeo, nGeo, oGeo, pGeo, qGeo, rGeo, sGeo,
//    tGeo, uGeo, vGeo, wGeo, xGeo, yGeo, zGeo
    
    // have to figure out a way to share these Geos
    
    var aGeoF: Letter!
    //    var aGeoF, bGeoF, cGeoF, dGeoF, eGeoF, fGeoF, gGeoF, hGeoF, iGeoF,
//    jGeoF, kGeoF, lGeoF, mGeoF, nGeoF, oGeoF, pGeoF, qGeoF, rGeoF, sGeoF,
//    tGeoF, uGeoF, vGeoF, wGeoF, xGeoF, yGeoF, zGeoF: Letter!
    
    
    
    var  aNodeFrozen, bNodeFrozen, cNodeFrozen: LetterNode!
    
 //   dNodeFrozen, eNodeFrozen, fNodeFrozen, gNodeFrozen,
//    hNodeFrozen, iNodeFrozen, jNodeFrozen, kNodeFrozen, lNodeFrozen, mNodeFrozen, nNodeFrozen, oNodeFrozen, pNodeFrozen, qNodeFrozen, rNodeFrozen, sNodeFrozen, tNodeFrozen, uNodeFrozen, vNodeFrozen, wNodeFrozen,
//    xNodeFrozen, yNodeFrozen, zNodeFrozen

    
    var frozenArray: [LetterNode] = []
    var freeArray: [LetterNode] = []
    var geoArray: [Letter] = []
    
    var aNodeFree, bNodeFree, cNodeFree: LetterNode!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loadNodesFree2()
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

//        runWild(aNodeFree)
//        runWild(bNodeFree)
//        runWild(cNodeFree)
        
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
        
        pauseLabel = UILabel()
        gameView.addSubview(pauseLabel)
        
        pauseLabel.adjustsFontSizeToFitWidth = true
        
        pauseLabel.font = UIFont(name: "Arial", size: 36.0 )
        pauseLabel.text = "Pause"
        pauseLabel.layer.masksToBounds = true
        //        startLabel.layer.cornerRadius = 125
        pauseLabel.layer.backgroundColor = UIColor.yellow.cgColor
        
        pauseLabel.translatesAutoresizingMaskIntoConstraints = false
        pauseLabel.layer.cornerRadius = startLabel.frame.width/2
        
        pauseLabel.widthAnchor.constraint(equalTo: startLabel.heightAnchor, multiplier: 0.0)
        pauseLabel.leadingAnchor.constraint(equalTo: gameView.leadingAnchor, constant: 50).isActive = true
        pauseLabel.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 150).isActive = true
        pauseLabel.isUserInteractionEnabled = true
        
        let startTap = UITapGestureRecognizer(target: self, action: #selector(handleStartTap(_:)))
        //
        startLabel.addGestureRecognizer(startTap)
        
        let pauseTap = UITapGestureRecognizer(target: self, action: #selector(handlePauseTap(_:)))
        pauseLabel.addGestureRecognizer(pauseTap)
        
        
        
    }
    
    @objc func handlePauseTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        // TODO: fix pause exploit
        
        if pauseBool == true {
            pauseBool = false
            scnView.scene?.isPaused = true
        } else{
            pauseBool = true
            scnView.scene?.isPaused = false
        }
        
        
    }
    
    @objc func handleStartTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        print("handletapcalled")
        
        scene.rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode()
        }
        viewDidLoad()
        
    }
    
    func degreesToRadians(degrees: Float) -> Float {
        return degrees * Float.pi / 180
    }
    
    func radiansToDegress(radians: Float) -> Float {
        return radians * 180 / Float.pi
    }
    
    
}
