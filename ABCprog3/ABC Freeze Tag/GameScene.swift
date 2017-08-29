//
//  MainScene.swift
//  ABC Freeze Tag
//
//  Created by Lawrence Herman on 8/1/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SceneKit
import Foundation

protocol GameSceneDelegate: class{
    func enableScene()
    func disableScene()
}

class GameScene: SCNScene {
    
    var aGeo, bGeo, cGeo, dGeo, eGeo, fGeo, gGeo, hGeo, iGeo,
    jGeo, kGeo, lGeo, mGeo, nGeo, oGeo, pGeo, qGeo, rGeo, sGeo,
    tGeo, uGeo, vGeo, wGeo, xGeo, yGeo, zGeo: Letter!
    
    var aGeoF, bGeoF, cGeoF, dGeoF, eGeoF, fGeoF, gGeoF, hGeoF, iGeoF,
    jGeoF, kGeoF, lGeoF, mGeoF, nGeoF, oGeoF, pGeoF, qGeoF, rGeoF, sGeoF,
    tGeoF, uGeoF, vGeoF, wGeoF, xGeoF, yGeoF, zGeoF: Letter!
    
    var  aNodeFrozen, bNodeFrozen, cNodeFrozen, dNodeFrozen, eNodeFrozen, fNodeFrozen, gNodeFrozen,hNodeFrozen, iNodeFrozen, jNodeFrozen, kNodeFrozen, lNodeFrozen, mNodeFrozen, nNodeFrozen, oNodeFrozen, pNodeFrozen, qNodeFrozen, rNodeFrozen, sNodeFrozen, tNodeFrozen, uNodeFrozen, vNodeFrozen, wNodeFrozen,
    xNodeFrozen, yNodeFrozen, zNodeFrozen: LetterNode!
    
    var aNodeFree, bNodeFree, cNodeFree, dNodeFree, eNodeFree, fNodeFree, gNodeFree, hNodeFree, iNodeFree, jNodeFree, kNodeFree, lNodeFree, mNodeFree, nNodeFree, oNodeFree, pNodeFree, qNodeFree, rNodeFree, sNodeFree, tNodeFree, uNodeFree, vNodeFree, wNodeFree, xNodeFree, yNodeFree, zNodeFree: LetterNode!
    
    var letterCount = 26
    
    var schoolGeo: SCNGeometry!
    var schoolNode: SCNNode!
    var cameraNode: SCNNode!
    var floorNode: SCNNode!
    var particleNode: SCNNode!
    var particleGeo: SCNGeometry!
    
    var rdySet, go, startScream1, freezeTag, letterTapSound, winMusic: SCNAudioSource!
    var mx70BPM, mx100BPM, mx130BPM, mx160BPM: SCNAudioSource!
    var mx70BPMPlayer, mx100BPMPlayer, mx130BPMPlayer, mx160BPMPlayer: SCNAudioPlayer!
    var kidPlayGround1: SCNAudioSource!
    var youCaughtEverybody, yae1, yae2, greatjob: SCNAudioSource!
    var aSound, bSound, cSound, dSound, eSound, fSound, gSound, hSound, iSound, jSound, kSound, lSound, mSound, nSound, oSound, pSound, qSound, rSound, sSound, tSound, uSound,
    vSound, wSound, xSound, ySound, zSound: SCNAudioSource!
    var toSlow, giggle1, giggle2, overHere, cantCatchMe: SCNAudioSource!
    
    var frozenArray: [LetterNode] = []
    var freeArray: [LetterNode] = []
    
    weak var delegate: GameSceneDelegate?
    
    override init() {
        super.init()
        
        loadCameraAndLights()
        loadFloor()
        loadSchool()
        loadGeometry()
        loadSounds()
        loadNodesFrozen()
        loadNodesFree()
   }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func winParticle() {
        if let winParticleSystem = SCNParticleSystem(named: "winParticle.scnp", inDirectory: nil)  {
            
            particleGeo = SCNSphere(radius: 1)
            particleGeo.firstMaterial?.diffuse.contents = UIColor.clear
            
            particleNode = SCNNode(geometry: particleGeo)
            particleNode.position = SCNVector3(x: 140, y: 10, z: 170)
            particleNode.addParticleSystem(winParticleSystem)
            self.rootNode.addChildNode(particleNode)
        } else {
            print("particle load fail")
        }
    }
    
    func randomMissSound() {
        let i = arc4random_uniform(10)
        let missArray = [toSlow, giggle1, giggle2, overHere, cantCatchMe]
        
        if i == 0 {
            let node: LetterNode = freeArray[Int(arc4random_uniform(25))]
            let j = Int(arc4random_uniform(5))
            node.addAudioPlayer(SCNAudioPlayer(source: missArray[j]!))
        }
    }
    
    func switchMX() {
        let node = self.rootNode
        
        switch letterCount {
        case 20:
            node.removeAudioPlayer(mx70BPMPlayer)
            node.addAudioPlayer(mx100BPMPlayer)
        case 14:
            node.removeAudioPlayer(mx100BPMPlayer)
            node.addAudioPlayer(mx130BPMPlayer)
        case 8:
            node.removeAudioPlayer(mx130BPMPlayer)
            node.addAudioPlayer(mx160BPMPlayer)
        default:
            print("mx switch default")
        }
    }
    
    
    
    
    
    
    func nodeCaughtAnimation(node: LetterNode) {
        letterCount -= 1
        
        switchMX()
        
        let j = freeArray.index(of: node)!
        let frozenNode = frozenArray[j]
        let radOffset = abs(degreesToRadians(degrees: 90))


//        print("before action \(currentEuler)")


        
        var a = cameraNode.eulerAngles.y
        a += radOffset
        
        let x = 140 + (14 * cos(a))
        let z = -190 + (14 * sin(a))
        
        node.removeAllActions()
        
        var cameraNodeEuler = cameraNode.eulerAngles.y
        
        while cameraNodeEuler > 2 * Float.pi {
            cameraNodeEuler -= (2 * Float.pi)
        }
        while cameraNodeEuler < -(2 * Float.pi) {
            cameraNodeEuler += (2 * Float.pi)
        }
        if cameraNodeEuler < 0 {
            cameraNodeEuler = (2 * Float.pi) - abs(cameraNodeEuler)
        }
        print(cameraNodeEuler)
        var newLetterEuler: Float = 0.0
        
        if cameraNodeEuler > 0 && cameraNodeEuler < Float.pi {
            newLetterEuler = cameraNodeEuler + Float.pi
        }
        if cameraNodeEuler > Float.pi && cameraNodeEuler < (2 * Float.pi) {
            newLetterEuler = cameraNodeEuler - Float.pi
        }
        print(newLetterEuler)
        newLetterEuler += Float.pi
        
        node.eulerAngles.y = newLetterEuler
//        node.runAction(SCNAction.rotateTo(x: 0, y: 0, z: 0, duration: 0.1))

        
        let tapSound = SCNAction.playAudio(letterTapSound, waitForCompletion: false)
        let presentLetter = SCNAction.move(to: SCNVector3(x, 5, -z), duration: 0.5)
        let playLetterSound = SCNAction.playAudio(node.letterSound!, waitForCompletion: true)
        let moveToHome = SCNAction.move(to: node.frozenPosition!, duration: 1.0)
        let hideFrozenNode = SCNAction.fadeOpacity(to: 0, duration: 3.0)
        let actionArray = [tapSound, presentLetter, playLetterSound, moveToHome]
        let sequence = SCNAction.sequence(actionArray)
        
        node.runAction(sequence) {
            node.eulerAngles.y = 0
            if self.letterCount != 0 {
                self.delegate?.enableScene()
            } else{
                self.delegate?.disableScene()
                self.winSequence()
            }
        }
        
//        print(radOffset)
//        var currentEuler = (node.eulerAngles.y)

        
//        print("node after action \(currentEuler)")

        
        
        
//
//        tempAngle =  -(tempAngle)
//        print("temp angle \(tempAngle)")

//        node.eulerAngles.y = tempAngle
        
        
        //        var tempAngle = atan2f(-z - 190, x - 140)

        
       
//        node.runAction(SCNAction.rotateTo(x: 0, y: 0, z: 0, duration: 0.1))
        frozenNode.runAction(hideFrozenNode)
    }
    
    
    
    
    
    func winSequence() {
        let node = self.rootNode
        node.removeAllAudioPlayers()
        
        winParticle()
        
        let yea1Sound = SCNAction.playAudio(yae1, waitForCompletion: false)
        let yea2Sound = SCNAction.playAudio(yae2, waitForCompletion: true)
        let music = SCNAction.playAudio(winMusic, waitForCompletion: true)
        let youCaughtEverybodySound = SCNAction.playAudio(youCaughtEverybody, waitForCompletion: true)
        let greatJobSound = SCNAction.playAudio(greatjob, waitForCompletion: false)
        
        let sequence = [yea1Sound, yea2Sound, youCaughtEverybodySound, music, greatJobSound]
        let actionSequence = SCNAction.sequence(sequence)
        
        node.runAction(actionSequence)
    }
    
    func startPlayAudio() -> SCNAction {
        return SCNAction.sequence([SCNAction.playAudio(rdySet, waitForCompletion: true), SCNAction.playAudio(startScream1, waitForCompletion: false),SCNAction.playAudio(freezeTag, waitForCompletion: false)])
    }
    
    func runWild(_ node: LetterNode) {
        let runForward = SCNAction.moveBy(x: 0.0, y: 0.0, z: 10, duration: 0.15)
        let runBackward = SCNAction.moveBy(x: 0.0, y: 0.0, z: -10.0, duration: 0.15)
        let runRight = SCNAction.moveBy(x: 10.00, y: 0, z: 0, duration: 0.15)
        let runLeft = SCNAction.moveBy(x: -10.00, y: 0, z: 0, duration: 0.15)
        
        let yLeft = degreesToRadians(degrees: 90)
        let yRight = degreesToRadians(degrees: -90)
        
        let turnLeft = SCNAction.rotateBy(x: 0, y: CGFloat(yLeft), z: 0, duration: 0.15)
        let turnRight = SCNAction.rotateBy(x: 0, y: CGFloat(yRight), z: 0, duration: 0.15)
        
        let x = arc4random_uniform(2)
        let j = arc4random_uniform(4)
        let i = arc4random_uniform(2)
        
        

        
        
        
        if node.frozen == false  {
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
                    if i == 0 {
                        node.runAction(runLeft, completionHandler: {
                            if j == 1 {node.runAction(turnLeft)}
                            self.runWild(node)
                        })
                    }
                    if i == 1 {
                        node.runAction(runRight, completionHandler: {
//                            if j == 1 {node.runAction(turnRight)}
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
                } else if node.position.z > 250 {
                    node.runAction(runBackward, completionHandler: {
                        self.runWild(node)
                    })
                } else {
//                    let i = arc4random_uniform(2)
                    
                    if i == 0 {
                        node.runAction(runForward, completionHandler: {
//                            if j == 1 {node.runAction(turnLeft)}
                            self.runWild(node)
                        })
                    }
                    if i == 1 {
                        node.runAction(runBackward, completionHandler: {
                            if j == 1 {node.runAction(turnRight)}
                            self.runWild(node)
                        })
                    }
                }
            }
        }
    }
    
    
    
    func gameSceneStart () {
        allRunWild()
        schoolNode.isHidden = true
        self.rootNode.addAudioPlayer(SCNAudioPlayer(source: kidPlayGround1))
        self.rootNode.addAudioPlayer(mx70BPMPlayer)
        self.makeFrozenNodesVisible()
    }
    
    func allRunWild() {
        self.runWild(self.aNodeFree)
        self.runWild(self.bNodeFree)
        self.runWild(self.cNodeFree)
        self.runWild(self.dNodeFree)
        self.runWild(self.eNodeFree)
        self.runWild(self.fNodeFree)
        self.runWild(self.gNodeFree)
        self.runWild(self.hNodeFree)
        self.runWild(self.iNodeFree)
        self.runWild(self.jNodeFree)
        self.runWild(self.kNodeFree)
        self.runWild(self.lNodeFree)
        self.runWild(self.mNodeFree)
        self.runWild(self.nNodeFree)
        self.runWild(self.oNodeFree)
        self.runWild(self.pNodeFree)
        self.runWild(self.qNodeFree)
        self.runWild(self.rNodeFree)
        self.runWild(self.sNodeFree)
        self.runWild(self.tNodeFree)
        self.runWild(self.uNodeFree)
        self.runWild(self.vNodeFree)
        self.runWild(self.wNodeFree)
        self.runWild(self.xNodeFree)
        self.runWild(self.yNodeFree)
        self.runWild(self.zNodeFree)
    }
}
