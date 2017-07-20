//
//  GameViewController.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 6/26/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

//import UIKit
import QuartzCore
import SceneKit
import SpriteKit

class GameViewController: UIViewController, SCNPhysicsContactDelegate {
    
    let scene = SCNScene()
    let gameView = UIView()
    var startLabel: UILabel!
//    var pauseLabel: UILabel!
    
    var scnView: SCNView!
    var pauseBool: Bool = true
    var startTapBool: Bool = true
    var tapGesture: UITapGestureRecognizer!
    var i = 14
    
    
    var aGeo, bGeo, cGeo, dGeo, eGeo, fGeo, gGeo, hGeo, iGeo,
    jGeo, kGeo, lGeo, mGeo, nGeo, oGeo, pGeo, qGeo, rGeo, sGeo,
    tGeo, uGeo, vGeo, wGeo, xGeo, yGeo, zGeo: Letter!
    
    // have to figure out a way to share these Geos
    
    var aGeoF, bGeoF, cGeoF, dGeoF, eGeoF, fGeoF, gGeoF, hGeoF, iGeoF,
    jGeoF, kGeoF, lGeoF, mGeoF, nGeoF, oGeoF, pGeoF, qGeoF, rGeoF, sGeoF,
    tGeoF, uGeoF, vGeoF, wGeoF, xGeoF, yGeoF, zGeoF: Letter!
    
    var  aNodeFrozen, bNodeFrozen, cNodeFrozen, dNodeFrozen, eNodeFrozen, fNodeFrozen, gNodeFrozen,hNodeFrozen, iNodeFrozen, jNodeFrozen, kNodeFrozen, lNodeFrozen, mNodeFrozen, nNodeFrozen, oNodeFrozen, pNodeFrozen, qNodeFrozen, rNodeFrozen, sNodeFrozen, tNodeFrozen, uNodeFrozen, vNodeFrozen, wNodeFrozen,
    xNodeFrozen, yNodeFrozen, zNodeFrozen: LetterNode!
    
    
    var frozenArray: [LetterNode] = []
    var freeArray: [LetterNode] = []
    
    var aNodeFree, bNodeFree, cNodeFree, dNodeFree, eNodeFree, fNodeFree, gNodeFree, hNodeFree, iNodeFree, jNodeFree, kNodeFree, lNodeFree, mNodeFree, nNodeFree, oNodeFree, pNodeFree, qNodeFree, rNodeFree, sNodeFree, tNodeFree, uNodeFree, vNodeFree, wNodeFree, xNodeFree, yNodeFree, zNodeFree: LetterNode!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraAndLights()
        environment()
        
        loadGeometry()
        loadNodesFrozen()
        loadNodesFree()
        
        
        
        scnView = self.view as! SCNView
        scnView.scene = scene
//        scene.physicsWorld.contactDelegate = self
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.blue
        scnView.autoenablesDefaultLighting = false
        

        let spriteScene = SKScene(size: CGSize(width: 750, height: 1334))
//        spriteScene.scaleMode = .aspectFill
        
        let spritePlayLabel = SKLabelNode()
        spritePlayLabel.position = CGPoint(x: 300, y: 150)
        spritePlayLabel.text = "Play"
        spritePlayLabel.color = UIColor.black
        
        spriteScene.addChild(spritePlayLabel)
        
    
        
        
        
        
//        let button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 100, height: 200))
//        // Put it in the center of the scene
//        button.position = CGPoint(x: 150, y: 150)
//        spriteScene.addChild(button)
        
//        if let b = SKReferenceNode(fileNamed: "SparkParticle.sks") {
//            spriteScene.addChild(b)
//            print("particle loaded")
//        }
        
        scnView.overlaySKScene = spriteScene
//
//
     
    
//

        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLetterTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
        tapGesture.isEnabled = false

//        loadGameView()

    }
    
//    class ButtonTestScene: SKScene {
//
//        var button: SKNode! = nil
//
//        override func didMove(to view: SKView) {
//            // Create a simple red rectangle that's 100x44
//            button = SKSpriteNode(color: SKColor.red, size: CGSize(width: 100, height: 44))
//            // Put it in the center of the scene
//            button.position = CGPoint(x: 100, y: 100)
//
//            self.addChild(button)
//        }
    
//        override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
//            // Loop over all the touches in this event
//            for touch: AnyObject in touches {
//                // Get the location of the touch in this scene
//                let location = touch.locationInNode(self)
//                // Check if the location of the touch is within the button's bounds
//                if button.containsPoint(location) {
//                    println("tapped!")
//                }
//            }
//        }
//    }
    
    func runWild(_ node: LetterNode) {
        
        let runForward = SCNAction.moveBy(x: 0.0, y: 0.0, z: 20, duration: 0.3)
        let runBackward = SCNAction.moveBy(x: 0.0, y: 0.0, z: -20.0, duration: 0.3)
        let runRight = SCNAction.moveBy(x: 20.00, y: 0, z: 0, duration: 0.3)
        let runLeft = SCNAction.moveBy(x: -20.00, y: 0, z: 0, duration: 0.3)
        
        if node.frozen == false  {
            
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
    }
    
    @objc func handleLetterTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        
        print("tap working")
        
        let tappedNode: LetterNode!
        
        let tapCG = gestureRecognizer.location(in: scnView)
        
        let hitResults = scnView.hitTest(tapCG, options: [SCNHitTestOption.boundingBoxOnly: true, SCNHitTestOption.clipToZRange: true])
        
        if hitResults.first?.node is LetterNode
        {
            tappedNode = (hitResults.first?.node as! LetterNode)
            if tappedNode.frozenPosition != nil && tappedNode.frozen == false{
                tappedNode.frozen = true
                tapGesture.isEnabled = false
                nodeCaughtAnimation(node: tappedNode)
            }
        }
        
        if i == 0 {
            
            
            print("you won")
            
            // disable button
            // animation
            // viewDidLoad
            
        }
        
    }
    
    func nodeCaughtAnimation(node: LetterNode) {
        
        print(node)
        print(freeArray.count)
        print(frozenArray.count)
        
        i -= 1
        print(i)
        
        let j = freeArray.index(of: node)!
        let frozenNode = frozenArray[j]
        
        let wait = SCNAction.wait(duration: 1.0)
        let presentLetter = SCNAction.move(to: SCNVector3(133, 3, 170), duration: 0.5)
        let moveToHome = SCNAction.move(to: node.frozenPosition!, duration: 1.0)
        let hideFrozenNode = SCNAction.fadeOpacity(to: 0, duration: 3.0)
        
        let actionArray = [presentLetter, wait, moveToHome]
        let sequence = SCNAction.sequence(actionArray)
        node.runAction(sequence, completionHandler: tapGestureTrue)
        frozenNode.runAction(hideFrozenNode)
        
    }
    
    func tapGestureTrue() {
        tapGesture.isEnabled = true
    }
    
//    func loadGameView() {
//
//        scnView.addSubview(gameView)
//
//        gameView.translatesAutoresizingMaskIntoConstraints = false
//        gameView.trailingAnchor.constraint(equalTo: scnView.trailingAnchor).isActive = true
//        gameView.leadingAnchor.constraint(equalTo: scnView.leadingAnchor).isActive = true
//        gameView.topAnchor.constraint(equalTo: scnView.topAnchor).isActive = true
//        gameView.bottomAnchor.constraint(equalTo: scnView.bottomAnchor).isActive = true
//
//
//        startLabel = UILabel( )
//        gameView.addSubview(startLabel)
//
//        startLabel.adjustsFontSizeToFitWidth = true
//
//        startLabel.font = UIFont(name: "Arial", size: 36.0 )
//        startLabel.text = "START"
//        startLabel.layer.masksToBounds = true
//        //        startLabel.layer.cornerRadius = 125
//        startLabel.layer.backgroundColor = UIColor.green.cgColor
//
//        startLabel.translatesAutoresizingMaskIntoConstraints = false
//        startLabel.layer.cornerRadius = startLabel.frame.width/2
//
//        startLabel.widthAnchor.constraint(equalTo: startLabel.heightAnchor, multiplier: 0.0)
//        startLabel.trailingAnchor.constraint(equalTo: gameView.trailingAnchor, constant: -50).isActive = true
//        startLabel.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 150).isActive = true
//        startLabel.isUserInteractionEnabled = true
//
//        let startTap = UITapGestureRecognizer(target: self, action: #selector(handleStartTap(_:)))
//        startLabel.addGestureRecognizer(startTap)
//    }
    
    @objc func handleStartTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        if startTapBool == true {
            
            startTapBool = false
            tapGesture.isEnabled = true
            
            makeFrozenNodesVisible()
            runWild(aNodeFree)
            runWild(bNodeFree)
            runWild(cNodeFree)
            runWild(dNodeFree)
            runWild(eNodeFree)
            runWild(fNodeFree)
            runWild(gNodeFree)
            runWild(hNodeFree)
            runWild(iNodeFree)
            runWild(jNodeFree)
            runWild(kNodeFree)
            runWild(lNodeFree)
            runWild(mNodeFree)
            runWild(nNodeFree)
            
            
        } else {
            startTapBool = true
            tapGesture.isEnabled = false
            scene.rootNode.enumerateChildNodes { (node, stop) in
                node.removeFromParentNode() }
            i = 14
            frozenArray = []
            freeArray = []
            viewDidLoad()
        }
        
    }
    
    func degreesToRadians(degrees: Float) -> Float {
        return degrees * Float.pi / 180
    }
    
    func radiansToDegress(radians: Float) -> Float {
        return radians * 180 / Float.pi
    }
    
    
}

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
