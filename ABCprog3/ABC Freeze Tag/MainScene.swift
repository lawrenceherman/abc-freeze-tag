//
//  MainScene.swift
//  ABC Freeze Tag
//
//  Created by Lawrence Herman on 8/1/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SceneKit


class MainScene:  SCNScene {
    
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

    
    
//    var scnViewRef: SCNView?
    
    var letterCount = 26

    
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


    
    override init() {
        super.init()
        
        
        cameraAndLights()
        environment()
        loadGeometry()
        loadSounds()
        loadNodesFrozen()
        loadNodesFree()
        
        
        //        let playButtonX = Int(skScene.frame.width * 0.7)
        //        let playButtonY = Int(skScene.frame.height * 0.8)
        //        let playButton = SKShapeNode(radius: 45, color: UIColor.green, text: "Play", fontNamed: "Arial")
        //        playButton.position = CGPoint(x: playButtonX, y: playButtonY)
        //
        //        let stopButton = SKShapeNode(radius: 45, color: UIColor.red, text: "Stop", fontNamed: "Arial")
        //        let stopButtonX = Int(skScene.frame.width * 0.1)
        //        let stopButtonY = Int(skScene.frame.height * 0.8)
        //        stopButton.position = CGPoint(x: stopButtonX, y: stopButtonY)
        //
        //        skScene.addChild(stopButton)
        //        skScene.addChild(playButton)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func degreesToRadians(degrees: Float) -> Float {
        return degrees * Float.pi / 180
    }
    
    func radiansToDegress(radians: Float) -> Float {
        return radians * 180 / Float.pi
    }

    
    func cameraAndLights () {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        self.rootNode.addChildNode(cameraNode)
        cameraNode.camera?.xFov = 80
        let radians = degreesToRadians(degrees: -16)
        let eulerVector = SCNVector3Make(radians, 0, 0)
        cameraNode.eulerAngles = eulerVector
        cameraNode.position = SCNVector3(x: 140, y: 20, z: 190)
        cameraNode.camera?.zFar = 200
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 140, y: 100, z: 200)
        self.rootNode.addChildNode(lightNode)
        
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

    func environment () {
        let floor = SCNFloor()
        let grass1 = SCNMaterial()
        grass1.diffuse.contents = UIImage(named: "grass2")
        grass1.diffuse.wrapS = .repeat
        grass1.diffuse.wrapT = .repeat
        floor.reflectivity = 0
        floor.firstMaterial = grass1
        let floorNode = SCNNode(geometry: floor)
        let floorPhysics = SCNPhysicsBody.static()
        floorNode.physicsBody = floorPhysics
        self.rootNode.addChildNode(floorNode)
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
            print("reserved")
        }
    }
    
    func nodeCaughtAnimation(node: LetterNode) {
        
        letterCount -= 1
        print(letterCount)
        
        switchMX()
        
        let j = freeArray.index(of: node)!
        let frozenNode = frozenArray[j]
        
        let tapSound = SCNAction.playAudio(letterTapSound, waitForCompletion: false)
        let presentLetter = SCNAction.move(to: SCNVector3(134, 5, 176), duration: 0.5)
        let playLetterSound = SCNAction.playAudio(node.letterSound!, waitForCompletion: true)
        let moveToHome = SCNAction.move(to: node.frozenPosition!, duration: 1.0)
        let hideFrozenNode = SCNAction.fadeOpacity(to: 0, duration: 3.0)
        let actionArray = [tapSound, presentLetter, playLetterSound, moveToHome]
        let sequence = SCNAction.sequence(actionArray)
//        self.runAction(sequence, completionHandler: enableLetterTap)
        frozenNode.runAction(hideFrozenNode)
        
        if letterCount == 0 {
//            letterTap.isEnabled = false
//            startLabelTap.isEnabled = false
            winSequence()
        }
    }
    
    func winSequence() {
        let node = self.rootNode
        node.removeAllAudioPlayers()
        
        let yea1Sound = SCNAction.playAudio(yae1, waitForCompletion: false)
        let yea2Sound = SCNAction.playAudio(yae2, waitForCompletion: true)
        let music = SCNAction.playAudio(winMusic, waitForCompletion: true)
        let youCaughtEverybodySound = SCNAction.playAudio(youCaughtEverybody, waitForCompletion: true)
        let greatJobSound = SCNAction.playAudio(greatjob, waitForCompletion: false)
        
        let sequence = [yea1Sound, yea2Sound, music, youCaughtEverybodySound, greatJobSound]
        
        let actionSequence = SCNAction.sequence(sequence)
        
        node.runAction(actionSequence) {
//            self.startLabelTap.isEnabled = true
        }
    }
    
    func startPlayAudio() -> SCNAction {
        return SCNAction.sequence([SCNAction.playAudio(rdySet, waitForCompletion: true), SCNAction.playAudio(startScream1, waitForCompletion: false),SCNAction.playAudio(freezeTag, waitForCompletion: false)])
        
    }

    
    
    
    
    
    





}
