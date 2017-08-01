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
    
    let scene = SCNScene()
    let gameView = UIView()
    var startLabel: UILabel!
    
    var scnView: SCNView!
    var skScene: SKScene!
    var pauseBool: Bool = true
    var startTapBool: Bool = true
    var letterTap: UITapGestureRecognizer!
    var startLabelTap: UITapGestureRecognizer!
    var letterCount = 26
    
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
    
    var rdySet, go, startScream1, freezeTag, letterTapSound, winMusic: SCNAudioSource!
    var mx70BPM, mx100BPM, mx130BPM, mx160BPM: SCNAudioSource!
    var mx70BPMPlayer, mx100BPMPlayer, mx130BPMPlayer, mx160BPMPlayer: SCNAudioPlayer!
    var kidPlayGround1: SCNAudioSource!
    var youCaughtEverybody, yae1, yae2, greatjob: SCNAudioSource!
    var aSound, bSound, cSound, dSound, eSound, fSound, gSound, hSound, iSound, jSound, kSound, lSound, mSound, nSound, oSound, pSound, qSound, rSound, sSound, tSound, uSound,
    vSound, wSound, xSound, ySound, zSound: SCNAudioSource!
    var toSlow, giggle1, giggle2, overHere, cantCatchMe: SCNAudioSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraAndLights()
        environment()
        loadGeometry()
        loadSounds()
        loadNodesFrozen()
        loadNodesFree()
        
        scnView = self.view as! SCNView
        scnView.scene = scene
        scnView.allowsCameraControl = false
        scnView.showsStatistics = false
        scnView.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 1.0)
        scnView.autoenablesDefaultLighting = false
        

        let playButton = SKButtonNode(type: .Play)
        
//        let testSize = CGSize(width: 100, height: 100)
        
        skScene = SKScene(size: scnView.bounds.size)
        
        let playButtonX = Int(skScene.frame.width * 0.9)
        let playButtonY = Int(skScene.frame.height * 0.8)
        
        playButton.position = CGPoint(x: playButtonX, y: playButtonY)

        skScene.addChild(playButton)
        
        scnView.overlaySKScene = skScene
        
    
        
        
        letterTap = UITapGestureRecognizer(target: self, action: #selector(handleLetterTap(_:)))
        scnView.addGestureRecognizer(letterTap)
        
        
        
        
        
        letterTap.isEnabled = false
        loadGameView()
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
    
    @objc func handleLetterTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        print("handle letter tap")
        let tappedNode: LetterNode!
        let tapCG = gestureRecognizer.location(in: scnView)
        
        let hitResults = scnView.hitTest(tapCG, options: [SCNHitTestOption.boundingBoxOnly: true, SCNHitTestOption.clipToZRange: true])
        
        if hitResults.first?.node is LetterNode
        {
            tappedNode = (hitResults.first?.node as! LetterNode)
            if tappedNode.frozenPosition != nil && tappedNode.frozen == false {
                tappedNode.frozen = true
                letterTap.isEnabled = false
                nodeCaughtAnimation(node: tappedNode)
            }
            
        } else { randomMissSound() }
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
        
        let node = scene.rootNode
        
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
        node.runAction(sequence, completionHandler: enableLetterTap)
        frozenNode.runAction(hideFrozenNode)
        
        if letterCount == 0 {
            letterTap.isEnabled = false
            startLabelTap.isEnabled = false
            winSequence()
        }
    }
    
    func winSequence() {
        
        let node = scene.rootNode
        node.removeAllAudioPlayers()
        
        let yea1Sound = SCNAction.playAudio(yae1, waitForCompletion: false)
        let yea2Sound = SCNAction.playAudio(yae2, waitForCompletion: true)
        let music = SCNAction.playAudio(winMusic, waitForCompletion: true)
        let youCaughtEverybodySound = SCNAction.playAudio(youCaughtEverybody, waitForCompletion: true)
        let greatJobSound = SCNAction.playAudio(greatjob, waitForCompletion: false)
        
        let sequence = [yea1Sound, yea2Sound, music, youCaughtEverybodySound, greatJobSound]
        
        let actionSequence = SCNAction.sequence(sequence)
        
        node.runAction(actionSequence) {
            self.startLabelTap.isEnabled = true
        }
    }
    
    func enableLetterTap() {
        
        if letterCount > 0 {
            letterTap.isEnabled = true
        }
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
        
        // startLabel.adjustsFontSizeToFitWidth = true
        
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
        
        startLabelTap = UITapGestureRecognizer(target: self, action: #selector(handleStartTap(_:)))
        startLabel.addGestureRecognizer(startLabelTap)
        
    }
    
    func startPlayAudio() -> SCNAction {
        
        return SCNAction.sequence([SCNAction.playAudio(rdySet, waitForCompletion: true), SCNAction.playAudio(startScream1, waitForCompletion: false),SCNAction.playAudio(freezeTag, waitForCompletion: false)])
        
    }
    
    @objc func handleStartTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        if startTapBool == true {
            print(startTapBool)
            self.startTapBool = false
            self.startLabelTap.isEnabled = false
            // label change doesnt work in CH
            self.startLabel.text = "REST"
            
            scene.rootNode.runAction(startPlayAudio(), completionHandler: {
                
                self.scene.rootNode.addAudioPlayer(SCNAudioPlayer(source: self.kidPlayGround1))
                self.scene.rootNode.addAudioPlayer(self.mx70BPMPlayer)
                self.makeFrozenNodesVisible()
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
                self.startLabelTap.isEnabled = true
                self.letterTap.isEnabled = true
            })
        } else {
            
            startTapBool = true
            letterTap.isEnabled = false
            scene.rootNode.enumerateChildNodes { (node, stop) in
                node.removeFromParentNode() }
            scene.rootNode.removeAllAudioPlayers()
            frozenArray = []
            freeArray = []
            letterCount = 26
            viewDidLoad()
        }
    }
    
    func degreesToRadians(degrees: Float) -> Float {
        return degrees * Float.pi / 180
    }
    
    func radiansToDegress(radians: Float) -> Float {
        return radians * 180 / Float.pi
    }
    
    func loadSounds() {
        
        rdySet = SCNAudioSource(named: "ABC_READY_SET_1.mp3")
        rdySet.isPositional = false
        rdySet.load()
        
        go = SCNAudioSource(named: "ABC_GO_1.mp3")
        go.isPositional = false
        go.load()
        
        startScream1 = SCNAudioSource(named: "ABC_START_SCREAM_1.mp3")
        startScream1.isPositional = false
        startScream1.load()
        
        kidPlayGround1 = SCNAudioSource(named: "KIDS_PLAYGROUND_1.mp3")
        kidPlayGround1.volume = 0.8
        kidPlayGround1.isPositional = false
        kidPlayGround1.loops = true
        kidPlayGround1.shouldStream = true
        
        freezeTag = SCNAudioSource(named: "ABC_FREEZE_TAG_GROUP_1.mp3")
        freezeTag.isPositional = false
        freezeTag.load()
        
        letterTapSound = SCNAudioSource(named: "ABC_LETTER_TAP_FX_1.mp3")
        letterTapSound.volume = 0.8
        letterTapSound.load()
        
        winMusic = SCNAudioSource(named: "ABC_WIN_MX_1.mp3")
        winMusic.load()
        
        greatjob = SCNAudioSource(named: "ABC_GREAT_JOB_SKY_1.mp3")
        greatjob.load()
        
        youCaughtEverybody = SCNAudioSource(named: "ABC_YOU_CAUGHT_EVERYBODY_GRACE_1.mp3")
        youCaughtEverybody.load()
        
        yae1 = SCNAudioSource(named: "ABC_YEAAA_GRACE_1.mp3")
        yae1.load()
        
        yae2 = SCNAudioSource(named: "ABC_YEAAAA_SKY_1.mp3")
        yae2.load()
        
        toSlow = SCNAudioSource(named: "ABC_TO_SLOW_SKY_1.mp3")
        toSlow.volume = 0.5
        toSlow.load()
        
        giggle1 = SCNAudioSource(named: "KID_GIRL_GIGGLE_5.mp3")
        giggle1.load()
        
        giggle2 = SCNAudioSource(named: "KID_GIRL_GIGGLE_6.mp3")
        giggle2.load()
        
        overHere = SCNAudioSource(named: "ABC_OVER_HERE_GRACE_1.mp3")
        overHere.volume = 0.5
        overHere.load()
        
        cantCatchMe = SCNAudioSource(named: "ABC_YOU_CANT_CATCH_ME_GRACE_1.mp3")
        cantCatchMe.volume = 0.5
        cantCatchMe.load()
        
        mx70BPM = SCNAudioSource(named: "ABC_FT_1_70.mp3")
        mx70BPM.isPositional = false
        mx70BPM.volume = 0.3
        mx70BPM.loops = true
        mx70BPM.shouldStream = true
        mx70BPMPlayer = SCNAudioPlayer(source: mx70BPM)
        
        mx100BPM = SCNAudioSource(named: "ABC_FT_2_100.mp3")
        mx100BPM.isPositional = false
        mx100BPM.volume = 0.3
        mx100BPM.loops = true
        mx100BPM.shouldStream = true
        mx100BPMPlayer = SCNAudioPlayer(source: mx100BPM)
        
        mx130BPM = SCNAudioSource(named: "ABC_FT_3_130.mp3")
        mx130BPM.isPositional = false
        mx130BPM.volume = 0.3
        mx130BPM.loops = true
        mx130BPM.shouldStream = true
        mx130BPMPlayer = SCNAudioPlayer(source: mx130BPM)
        
        mx160BPM = SCNAudioSource(named: "ABC_FT_4_160.mp3")
        mx160BPM.volume = 0.3
        mx160BPM.isPositional = false
        mx160BPM.loops = true
        mx160BPM.shouldStream = true
        mx160BPMPlayer = SCNAudioPlayer(source: mx160BPM)
        
        aSound = SCNAudioSource(named: "ABC_GROUP_LETTER_A.mp3")
        aSound.load()
        
        bSound = SCNAudioSource(named: "ABC_GROUP_LETTER_B.mp3")
        bSound.load()
        
        cSound = SCNAudioSource(named: "ABC_GROUP_LETTER_C.mp3")
        cSound.load()
        
        dSound = SCNAudioSource(named: "ABC_GROUP_LETTER_D.mp3")
        dSound.load()
        
        eSound = SCNAudioSource(named: "ABC_GROUP_LETTER_E.mp3")
        eSound.load()
        
        fSound = SCNAudioSource(named: "ABC_GROUP_LETTER_F.mp3")
        fSound.load()
        
        gSound = SCNAudioSource(named: "ABC_GROUP_LETTER_G.mp3")
        gSound.load()
        
        hSound = SCNAudioSource(named: "ABC_GROUP_LETTER_H.mp3")
        hSound.load()
        
        iSound = SCNAudioSource(named: "ABC_GROUP_LETTER_I.mp3")
        iSound.load()
        
        jSound = SCNAudioSource(named: "ABC_GROUP_LETTER_J.mp3")
        jSound.load()
        
        kSound = SCNAudioSource(named: "ABC_GROUP_LETTER_K.mp3")
        kSound.load()
        
        lSound = SCNAudioSource(named: "ABC_GROUP_LETTER_L.mp3")
        lSound.load()
        
        mSound = SCNAudioSource(named: "ABC_GROUP_LETTER_M.mp3")
        mSound.load()
        
        nSound = SCNAudioSource(named: "ABC_GROUP_LETTER_N.mp3")
        nSound.load()
        
        oSound = SCNAudioSource(named: "ABC_GROUP_LETTER_O.mp3")
        oSound.load()
        
        pSound = SCNAudioSource(named: "ABC_GROUP_LETTER_P.mp3")
        pSound.load()
        
        qSound = SCNAudioSource(named: "ABC_GROUP_LETTER_Q.mp3")
        qSound.load()
        
        rSound = SCNAudioSource(named: "ABC_GROUP_LETTER_R.mp3")
        rSound.load()
        
        sSound = SCNAudioSource(named: "ABC_GROUP_LETTER_S.mp3")
        sSound.load()
        
        tSound = SCNAudioSource(named: "ABC_GROUP_LETTER_T.mp3")
        tSound.load()
        
        uSound = SCNAudioSource(named: "ABC_GROUP_LETTER_U.mp3")
        uSound.load()
        
        vSound = SCNAudioSource(named: "ABC_GROUP_LETTER_V.mp3")
        vSound.load()
        
        wSound = SCNAudioSource(named: "ABC_GROUP_LETTER_W.mp3")
        wSound.load()
        
        xSound = SCNAudioSource(named: "ABC_GROUP_LETTER_X.mp3")
        xSound.load()
        
        ySound = SCNAudioSource(named: "ABC_GROUP_LETTER_Y.mp3")
        ySound.load()
        
        zSound = SCNAudioSource(named: "ABC_GROUP_LETTER_Z.mp3")
        zSound.load()
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
