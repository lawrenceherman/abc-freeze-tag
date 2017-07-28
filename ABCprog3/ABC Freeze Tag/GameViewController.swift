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
//import SpriteKit
//import AVFoundation

class GameViewController: UIViewController {
    
    let scene = SCNScene()
    let gameView = UIView()
    var startLabel: UILabel!
    //    var pauseLabel: UILabel!
    
    var scnView: SCNView!
    var pauseBool: Bool = true
    var startTapBool: Bool = true
    var tapGesture: UITapGestureRecognizer!
    var i = 26
    
    var aGeo, bGeo, cGeo, dGeo, eGeo, fGeo, gGeo, hGeo, iGeo,
    jGeo, kGeo, lGeo, mGeo, nGeo, oGeo, pGeo, qGeo, rGeo, sGeo,
    tGeo, uGeo, vGeo, wGeo, xGeo, yGeo, zGeo: Letter!
    
    // have to figure out a way to share these Geos
    
    var aGeoF, bGeoF, cGeoF, dGeoF, eGeoF, fGeoF, gGeoF, hGeoF, iGeoF,
    jGeoF, kGeoF, lGeoF, mGeoF, nGeoF, oGeoF, pGeoF, qGeoF, rGeoF, sGeoF,
    tGeoF, uGeoF, vGeoF, wGeoF, xGeoF, yGeoF, zGeoF: Letter!
    
    var  aNodeFrozen, bNodeFrozen, cNodeFrozen, dNodeFrozen, eNodeFrozen, fNodeFrozen, gNodeFrozen,hNodeFrozen, iNodeFrozen, jNodeFrozen, kNodeFrozen, lNodeFrozen, mNodeFrozen, nNodeFrozen, oNodeFrozen, pNodeFrozen, qNodeFrozen, rNodeFrozen, sNodeFrozen, tNodeFrozen, uNodeFrozen, vNodeFrozen, wNodeFrozen,
    xNodeFrozen, yNodeFrozen, zNodeFrozen: LetterNode!
    
    var aNodeFree, bNodeFree, cNodeFree, dNodeFree, eNodeFree, fNodeFree, gNodeFree, hNodeFree, iNodeFree, jNodeFree, kNodeFree, lNodeFree, mNodeFree, nNodeFree, oNodeFree, pNodeFree, qNodeFree, rNodeFree, sNodeFree, tNodeFree, uNodeFree, vNodeFree, wNodeFree, xNodeFree, yNodeFree, zNodeFree: LetterNode!
    
    var frozenArray: [LetterNode] = []
    var freeArray: [LetterNode] = []
    
    
    var rdySetGo: SCNAudioSource!
    var startScream1: SCNAudioSource!
    var freezeTag: SCNAudioSource!
//    var mx70BPM: SCNAudioSource!
//    var mx100BPM: SCNAudioSource!
//    var mx130BPM: SCNAudioSource!
//    var mx160BPM: SCNAudioSource!
    
    
//    var skylarA1Player: SCNAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraAndLights()
        environment()
        

        loadGeometry()
   
        loadNodesFrozen()
       
        loadNodesFree()
       
        loadSounds()

        
        scnView = self.view as! SCNView
        scnView.scene = scene
        //        scene.physicsWorld.contactDelegate = self
        scnView.allowsCameraControl = false
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.blue
        scnView.autoenablesDefaultLighting = false
   

        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLetterTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
        tapGesture.isEnabled = false
        
        loadGameView()
        
     
        
//        if let audioSource  = SCNAudioSource(fileNamed: "ABC_FT_1_70.mp3") {
//            
//            print("inside audio source")
//            
//            audioSource.loops = true
//            audioSource.isPositional = false
//            audioSource.shouldStream = true
//            scene.rootNode.addAudioPlayer(SCNAudioPlayer(source: audioSource))
//            
//            
//        }
        
       
    
    }
    
    func loadSounds() {
        
        rdySetGo = SCNAudioSource(named: "ABC_READY_SET_GO_GROUP_1.mp3")
        rdySetGo.isPositional = false
        rdySetGo.load()
        
        startScream1 = SCNAudioSource(named: "ABC_START_SCREAM_1.mp3")
        startScream1.isPositional = false
        startScream1.load()
        
        
        freezeTag = SCNAudioSource(named: "ABC_FREEZE_TAG_GROUP_1.mp3")
        freezeTag.isPositional = false
        freezeTag.load()
        

//        mx70BPM = SCNAudioSource(named: "ABC FT 1 70.mp3")
//        mx70BPM.loops = true
//        mx70BPM.load()
//        
//        mx100BPM = SCNAudioSource(named: "ABC FT 2 100.mp3")
//        mx100BPM.loops = true
//        mx100BPM.shouldStream = true
//
        
//        mx70BPM = SCNAudioSource(name: "ABC FT 1 70.mp3", volume: 20.0, positional: false, loops: true, shouldStream: false, shouldLoad: true)
//        mx70BPM.load()
        
        
//        let kidsPlayground1Player = SCNAudioPlayer(source: kidsPlayground1)
        
        
        
        //        self.scene.rootNode.addAudioPlayer(SCNAudioPlayer(source: SCNAudioSource(named: "KidsPlayground1.mp3")!))
        
//        aNodeFree.runAction(SCNAction.playAudio(skylarA1Source, waitForCompletion: true))
//        scene.rootNode.runAction(SCNAction.playAudio(mx70BPM, waitForCompletion: false))
        
    }
    
    func runWild(_ node: LetterNode) {
        
        let runForward = SCNAction.moveBy(x: 0.0, y: 0.0, z: 10, duration: 0.15)
        let runBackward = SCNAction.moveBy(x: 0.0, y: 0.0, z: -10.0, duration: 0.15)
        let runRight = SCNAction.moveBy(x: 10.00, y: 0, z: 0, duration: 0.15)
        let runLeft = SCNAction.moveBy(x: -10.00, y: 0, z: 0, duration: 0.15)
        
        if node.frozen == false  {
            
            let x = arc4random_uniform(2)
            
            if x == 0 {
                if node.position.x > 230 {
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
                } else if node.position.z > 160 {
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
    
    func switchMX() {
        
        
        
        
        
        
        
    }
    
    func nodeCaughtAnimation(node: LetterNode) {
        
        print(node)
        print(freeArray.count)
        print(frozenArray.count)
        
//        i -= 1
//        switch i {
//        case 20:
//            switchMX()
//        default:
//            <#code#>
//        }
        
        let j = freeArray.index(of: node)!
        let frozenNode = frozenArray[j]
        
        let wait = SCNAction.wait(duration: 1.0)
        let presentLetter = SCNAction.move(to: SCNVector3(134, 5, 176), duration: 0.5)
        
        // add sound
        
//        let playLetter = SCNAction.playAudio(node.letterPlayer, waitForCompletion: true)

//        let tempPlayer = SCNAudioPlayer(source: node.letterPlayer)
//
//        node.addAudioPlayer(tempPlayer)
        
        
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
    
    func loadGameView() {
        
        scnView.addSubview(gameView)
        
        gameView.translatesAutoresizingMaskIntoConstraints = false
        gameView.trailingAnchor.constraint(equalTo: scnView.trailingAnchor).isActive = true
        gameView.leadingAnchor.constraint(equalTo: scnView.leadingAnchor).isActive = true
        gameView.topAnchor.constraint(equalTo: scnView.topAnchor).isActive = true
        gameView.bottomAnchor.constraint(equalTo: scnView.bottomAnchor).isActive = true
        
        
        
        startLabel = UILabel( )
        gameView.addSubview(startLabel)
        
        //        startLabel.adjustsFontSizeToFitWidth = true
        
        startLabel.font = UIFont(name: "Arial", size: 40.0 )
        
        startLabel.textAlignment = .center
        startLabel.text = "PLAY"
        startLabel.layer.masksToBounds = true
        startLabel.layer.cornerRadius = 25
        startLabel.layer.backgroundColor = UIColor.green.cgColor
        
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        //        startLabel.layer.cornerRadius = startLabel.frame.width/2
        
        startLabel.widthAnchor.constraint(equalTo: gameView.widthAnchor, multiplier: 0.13).isActive = true
        startLabel.heightAnchor.constraint(equalTo: gameView.heightAnchor, multiplier: 0.09 ).isActive = true
        startLabel.trailingAnchor.constraint(equalTo: gameView.trailingAnchor, constant: -30).isActive = true
        startLabel.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 120).isActive = true
        startLabel.isUserInteractionEnabled = true
        
        let startTap = UITapGestureRecognizer(target: self, action: #selector(handleStartTap(_:)))
        startLabel.addGestureRecognizer(startTap)
    }
    
    func startPlayAudio () {
//        
//        scene.rootNode.runAction(<#T##action: SCNAction##SCNAction#>)
//        
//        SCNAction.playAudio(rdySetGo, waitForCompletion: true)
//        SCNAction.playAudio(startScream1, waitForCompletion: false)
//        SCNAction.playAudio(freezeTag, waitForCompletion: false)
//        
//        scene.rootNode
//        
//        
//        
//        SCNAction.sequence(<#T##actions: [SCNAction]##[SCNAction]#>)
//        
        
        
        
    }
    
    
    
    
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
            runWild(oNodeFree)
            runWild(pNodeFree)
            runWild(qNodeFree)
            runWild(rNodeFree)
            runWild(sNodeFree)
            runWild(tNodeFree)
            runWild(uNodeFree)
            runWild(vNodeFree)
            runWild(wNodeFree)
            runWild(xNodeFree)
            runWild(yNodeFree)
            runWild(zNodeFree)
            
            startLabel.text = "REST"
            
        } else {
            startTapBool = true
            tapGesture.isEnabled = false
            scene.rootNode.enumerateChildNodes { (node, stop) in
                node.removeFromParentNode() }
            i = 26
            scene.rootNode.removeAllAudioPlayers()
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
