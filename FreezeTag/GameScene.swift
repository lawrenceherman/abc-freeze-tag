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
   var cameraNode: SCNNode!
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
      loadEnvironment()
      loadGeometry()
      loadSounds()
      loadNodesFrozen()
      loadNodesFree()
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   // Win animation particles
   func winParticle() {
      if let winParticleSystem = SCNParticleSystem(named: "winParticle.scnp", inDirectory: nil)  {
         
         particleGeo = SCNSphere(radius: 1)
         particleGeo.firstMaterial?.diffuse.contents = UIColor.clear
         particleNode = SCNNode(geometry: particleGeo)
         particleNode.position = SCNVector3(x: 140, y: 20, z: 190)
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
   
   //Switches music as more letters caught
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
   
   //TODO: Break down functions
   
   func nodeCaughtAnimation(node: LetterNode) {
      node.removeAllActions()
      letterCount -= 1
      
      switchMX()
      
      print(cameraNode.eulerAngles.y.debugDescription)
      
      let j = freeArray.firstIndex(of: node)!
      let frozenNode = frozenArray[j]
      let radOffset = abs(degreesToRadians(degrees: 90))
      
      var cameraNodeEulerY = cameraNode.eulerAngles.y
      let a = radOffset + cameraNodeEulerY
      let x = 140 + (14 * cos(a))
      let z = -190 + (14 * sin(a))
      
      var newLetterEuler: Float = 0.0
      
      while cameraNodeEulerY > 2 * Float.pi {
         cameraNodeEulerY -= (2 * Float.pi)
         print("greater thatn circ")
      }
      while cameraNodeEulerY < -(2 * Float.pi) {
         cameraNodeEulerY += (2 * Float.pi)
         print("less than circ")
      }
      
      if cameraNodeEulerY < 0 {
         cameraNodeEulerY = (2 * Float.pi) - abs(cameraNodeEulerY)
      }
      
      if cameraNodeEulerY >= 0 && cameraNodeEulerY < Float.pi {
         newLetterEuler = cameraNodeEulerY + Float.pi
      }
      if cameraNodeEulerY > Float.pi && cameraNodeEulerY < (2 * Float.pi) {
         newLetterEuler = cameraNodeEulerY - Float.pi
      }
      newLetterEuler += Float.pi
      node.eulerAngles.y = newLetterEuler
      
      let tapSound = SCNAction.playAudio(letterTapSound, waitForCompletion: false)
      let presentLetter = SCNAction.move(to: SCNVector3(x, 5, -z), duration: 0.5)
      let playLetterSound = SCNAction.playAudio(node.letterSound!, waitForCompletion: true)
      let moveToHome = SCNAction.move(to: node.frozenPosition!, duration: 1.0)
      let hideFrozenNode = SCNAction.fadeOpacity(to: 0, duration: 3.0)
      
      let actionArray = [tapSound, presentLetter, playLetterSound]
      let sequence = SCNAction.sequence(actionArray)
      
      node.runAction(sequence) {
         node.eulerAngles.y = 0
         if self.letterCount != 0 {
            self.delegate?.enableScene()
            node.runAction(moveToHome)
         } else{
            node.runAction(moveToHome)
            self.winSequence()
         }
      }
      
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
   
   //Defines random running and turning of letters.
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
            if node.position.x > 260 {
               node.runAction(runLeft, completionHandler: {
                  self.runWild(node)
               })
            } else if node.position.x < 0 {
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
                     self.runWild(node)
                  })
               }
            }
         }
         
         if x == 1 {
            if node.position.z < 40 {
               node.runAction(runForward, completionHandler: {
                  self.runWild(node)
               })
            } else if node.position.z > 290 {
               node.runAction(runBackward, completionHandler: {
                  self.runWild(node)
               })
            } else {
               if i == 0 {
                  node.runAction(runForward, completionHandler: {
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
      self.rootNode.addAudioPlayer(SCNAudioPlayer(source: kidPlayGround1))
      self.rootNode.addAudioPlayer(mx70BPMPlayer)
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
