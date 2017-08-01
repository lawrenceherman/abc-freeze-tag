//
//  GameViewController.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 6/26/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import QuartzCore
import SceneKit
import SpriteKit

class GameViewController: UIViewController {
    
    let scene = MainScene()
    
    
    
    
//    let gameView = UIView()
    
    var overlayScene: OverlayScene!
    
    var startLabel: UILabel!
    
    var scnView: SCNView!
    var skScene: MainScene!
    
    var pauseBool: Bool = true
    var startTapBool: Bool = true
    
    var scnViewTap: UITapGestureRecognizer!
//    var startLabelTap: UITapGestureRecognizer!
    
    
        
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        scnView = self.view as! SCNView
        

        scnView.scene = scene
        
        
        
        
        scnView.allowsCameraControl = false
        scnView.showsStatistics = false
        scnView.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 1.0)
        scnView.autoenablesDefaultLighting = false
        

        
        overlayScene = OverlayScene(size: scnView.bounds.size)
        
        let playNodeX = Int(overlayScene.frame.width * 0.9)
        let playNodeY = Int(overlayScene.frame.height * 0.8)
        overlayScene.playNode.position = CGPoint(x: playNodeX, y: playNodeY)
        scnView.overlaySKScene = overlayScene
        
        let stopNodeX = Int(overlayScene.frame.width * 0.1)
        let stopNodeY = Int(overlayScene.frame.height * 0.8)
        overlayScene.stopNode.position = CGPoint(x: stopNodeX, y: stopNodeY)
        
        
        
    
        
        
        
        
        scnViewTap = UITapGestureRecognizer(target: self, action: #selector(handleSCNViewTap(_:)))
        scnView.addGestureRecognizer(scnViewTap)
        
        
        scnViewTap.isEnabled = false
//        loadGameView()
    }
    
    func runWild(_ node: LetterNode) {
        let runForward = SCNAction.moveBy(x: 0.0, y: 0.0, z: 10, duration: 0.15)
        let runBackward = SCNAction.moveBy(x: 0.0, y: 0.0, z: -10.0, duration: 0.15)
        let runRight = SCNAction.moveBy(x: 10.00, y: 0, z: 0, duration: 0.15)
        let runLeft = SCNAction.moveBy(x: -10.00, y: 0, z: 0, duration: 0.15)
        
        if node.frozen == false  {
            
            let x = arc4random_uniform(2)
            
            if x == 0 {
                if node.position.x > 220 {
                    node.runAction(runLeft, completionHandler: {
                        self.runWild(node)
                    })
                } else if node.position.x < 40 {
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
                } else if node.position.z > 155 {
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
    }
    
    @objc func handleSCNViewTap(_ gestureRecognizer:
        UITapGestureRecognizer) {
        let tappedNode: LetterNode!
        let tapCG = gestureRecognizer.location(in: scnView)
        
        let hitResults = scnView.hitTest(tapCG, options: [SCNHitTestOption.boundingBoxOnly: true, SCNHitTestOption.clipToZRange: true])
        
        
        
        if hitResults.first?.node is LetterNode
        {
            tappedNode = (hitResults.first?.node as! LetterNode)
            if tappedNode.frozenPosition != nil && tappedNode.frozen == false {
                tappedNode.frozen = true
                scnViewTap.isEnabled = false
                self.scene.nodeCaughtAnimation(node: tappedNode)
            }
            
        } else { self.scene.randomMissSound() }
    }
    
  
    

    
//    func enableLetterTap() {
//        if letterCount > 0 {
//            letterTap.isEnabled = true
//        }
//    }
    
//    func loadGameView() {
//        scnView.addSubview(gameView)
//        
//        gameView.translatesAutoresizingMaskIntoConstraints = false
//        gameView.trailingAnchor.constraint(equalTo: scnView.trailingAnchor).isActive = true
//        gameView.leadingAnchor.constraint(equalTo: scnView.leadingAnchor).isActive = true
//        gameView.topAnchor.constraint(equalTo: scnView.topAnchor).isActive = true
//        gameView.bottomAnchor.constraint(equalTo: scnView.bottomAnchor).isActive = true
//        
//        startLabel = UILabel( )
//        gameView.addSubview(startLabel)
//        
//        // startLabel.adjustsFontSizeToFitWidth = true
//        
//        startLabel.font = UIFont(name: "Arial", size: 40.0 )
//        
//        startLabel.textAlignment = .center
//        startLabel.text = "PLAY"
//        startLabel.layer.masksToBounds = true
//        startLabel.layer.cornerRadius = 25
//        startLabel.layer.backgroundColor = UIColor.green.cgColor
//        
//        startLabel.translatesAutoresizingMaskIntoConstraints = false
//        //        startLabel.layer.cornerRadius = startLabel.frame.width/2
//        
//        startLabel.widthAnchor.constraint(equalTo: gameView.widthAnchor, multiplier: 0.13).isActive = true
//        startLabel.heightAnchor.constraint(equalTo: gameView.heightAnchor, multiplier: 0.09 ).isActive = true
//        startLabel.trailingAnchor.constraint(equalTo: gameView.trailingAnchor, constant: -30).isActive = true
//        startLabel.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 120).isActive = true
//        startLabel.isUserInteractionEnabled = true
//        
//        startLabelTap = UITapGestureRecognizer(target: self, action: #selector(handleStartTap(_:)))
//        startLabel.addGestureRecognizer(startLabelTap)
//        
//    }
    
//
//    
//    @objc func handleStartTap(_ gestureRecognizer: UITapGestureRecognizer) {
//        if startTapBool == true {
//            print(startTapBool)
////            self.startTapBool = false
////            self.startLabelTap.isEnabled = false
//            // label change doesnt work in CH
//            self.startLabel.text = "REST"
//            
//            scene.rootNode.runAction(scene.startPlayAudio(), completionHandler: {
//                
//                self.scene.rootNode.addAudioPlayer(SCNAudioPlayer(source: self.kidPlayGround1))
//                self.scene.rootNode.addAudioPlayer(self.mx70BPMPlayer)
//                self.makeFrozenNodesVisible()
//                self.runWild(self.aNodeFree)
//                self.runWild(self.bNodeFree)
//                self.runWild(self.cNodeFree)
//                self.runWild(self.dNodeFree)
//                self.runWild(self.eNodeFree)
//                self.runWild(self.fNodeFree)
//                self.runWild(self.gNodeFree)
//                self.runWild(self.hNodeFree)
//                self.runWild(self.iNodeFree)
//                self.runWild(self.jNodeFree)
//                self.runWild(self.kNodeFree)
//                self.runWild(self.lNodeFree)
//                self.runWild(self.mNodeFree)
//                self.runWild(self.nNodeFree)
//                self.runWild(self.oNodeFree)
//                self.runWild(self.pNodeFree)
//                self.runWild(self.qNodeFree)
//                self.runWild(self.rNodeFree)
//                self.runWild(self.sNodeFree)
//                self.runWild(self.tNodeFree)
//                self.runWild(self.uNodeFree)
//                self.runWild(self.vNodeFree)
//                self.runWild(self.wNodeFree)
//                self.runWild(self.xNodeFree)
//                self.runWild(self.yNodeFree)
//                self.runWild(self.zNodeFree)
//                self.startLabelTap.isEnabled = true
//                self.letterTap.isEnabled = true
//            })
//        } else {
//            
//            startTapBool = true
////            letterTap.isEnabled = false
//            scene.rootNode.enumerateChildNodes { (node, stop) in
//                node.removeFromParentNode() }
//           
//            
//            scene.rootNode.removeAllAudioPlayers()
//    
////            
////            frozenArray = []
////    
////            freeArray = []
////   
////            letterCount = 26
//            
//            scnView.overlaySKScene = nil
//   
//            viewDidLoad()
//        }
//    }
    
        

}

//extension SCNAudioSource {
//    convenience init(name: String, volume: Float = 1.0, positional: Bool = true, loops: Bool = false, shouldStream: Bool = false, shouldLoad: Bool = true) {
//        self.init(named: "Sounds/\(name)")
//        self.volume = volume
//        self.isPositional = positional
//        self.loops = loops
//        self.shouldStream = shouldStream
//        if shouldLoad {
//            load()
//        }
//    }
//}

//        pauseLabel = UILabel()
//        gameView.addSubview(pauseLabel)
//
//        pauseLabel.adjustsFontSizeToFitWidth = true
//
//        pauseLabel.font = UIFont(name: "Arial", size: 36.0 )
//        pauseLabel.text = "Pause"
//        pauseLabel.layer.masksToBounds = true
//        //        startLabel.layer.cornerRadius = 125
//        pauseLabel.layer.backgroundColor = UIColor.yellow.cgColor
//
//        pauseLabel.translatesAutoresizingMaskIntoConstraints = false
//        pauseLabel.layer.cornerRadius = startLabel.frame.width/2
//
//        pauseLabel.widthAnchor.constraint(equalTo: startLabel.heightAnchor, multiplier: 0.0)
//        pauseLabel.leadingAnchor.constraint(equalTo: gameView.leadingAnchor, constant: 50).isActive = true
//        pauseLabel.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 150).isActive = true
//        pauseLabel.isUserInteractionEnabled = true
//


//        let pauseTap = UITapGestureRecognizer(target: self, action: #selector(handlePauseTap(_:)))
//        pauseLabel.addGestureRecognizer(pauseTap)
//
//    }
//
//    @objc func handlePauseTap(_ gestureRecognizer: UITapGestureRecognizer) {
//
//        // TODO: fix pause exploit
//
//        if pauseBool == true {
//            pauseBool = false
//            scnView.scene?.isPaused = true
//        } else{
//            pauseBool = true
//            scnView.scene?.isPaused = false
//        }
//
//
//    }
