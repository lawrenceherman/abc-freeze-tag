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
import Foundation

class GameViewController: UIViewController {
    
//    let scene = MainScene()
    
    
    
    
//    let gameView = UIView()
    
//    var overlayScene: OverlayScene!
    
//    var startLabel: UILabel!
    var gameView: SCNView!
    var gameScene: GameScene!

    var spriteScene: OverlayScene!
    
//    var pauseBool: Bool = true
//    var startTapBool: Bool = true
    
    var gameViewTap: UITapGestureRecognizer!
//    var startLabelTap: UITapGestureRecognizer!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView = self.view as! SCNView
        gameScene = GameScene()
        gameView.scene = gameScene
        
        spriteScene = OverlayScene(size: gameView.bounds.size)
        spriteScene.gameViewController = self
        
        gameView.overlaySKScene = spriteScene
        
        

        gameView.allowsCameraControl = false
        gameView.showsStatistics = false
        gameView.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 1.0)
        gameView.autoenablesDefaultLighting = false

        
        layOut2DOverlay()

        
        gameViewTap = UITapGestureRecognizer(target: self, action: #selector(handleGameViewTap(_:)))
        gameView.addGestureRecognizer(gameViewTap)
        gameViewTap.isEnabled = false
    
        
        spriteScene.addObserver(gameView.scene!, forKeyPath: "paused", options: .new, context: nil)

    }
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "test" {
//            print("gameview observeValue keypath = test")
//            
//        }
//    }

    func layOut2DOverlay() {
        
        
        let playNodeX = Int(spriteScene.frame.width * 0.9)
        let playNodeY = Int(spriteScene.frame.height * 0.8)
        spriteScene.playNode.position = CGPoint(x: playNodeX, y: playNodeY)
        
        let stopNodeX = Int(spriteScene.frame.width * 0.1)
        let stopNodeY = Int(spriteScene.frame.height * 0.8)
        spriteScene.stopNode.position = CGPoint(x: stopNodeX, y: stopNodeY)
        
    }
    
    
    
    @objc func handleGameViewTap(_ gestureRecognizer:
        UITapGestureRecognizer) {
        
        print("handleGameViewTap/n")
        let tappedNode: LetterNode!
        let tapCG = gestureRecognizer.location(in: gameView)
        
        let hitResults = gameView.hitTest(tapCG, options: [SCNHitTestOption.boundingBoxOnly: true, SCNHitTestOption.clipToZRange: true])
        
        if hitResults.first?.node is LetterNode
        {
            tappedNode = (hitResults.first?.node as! LetterNode)
            if tappedNode.frozenPosition != nil && tappedNode.frozen == false {
                tappedNode.frozen = true
                gameViewTap.isEnabled = false
                gameScene.nodeCaughtAnimation(node: tappedNode)
            }
            
        } else { gameScene.randomMissSound() }
    }
    
    func startGame() {
        
        gameScene.rootNode.runAction(gameScene.startPlayAudio(), completionHandler: {
            self.gameScene.gameSceneStart()
            self.gameViewTap.isEnabled = true
        })
    }
   
    func stopGame() {
        
//        startTapBool = true
        gameViewTap.isEnabled = false
        gameScene.rootNode.enumerateChildNodes { (node, stop) in
        node.removeFromParentNode() }
        gameScene.rootNode.removeAllAudioPlayers()
        gameScene.frozenArray = []
        gameScene.freeArray = []
        gameScene.letterCount = 26
        gameView.overlaySKScene = nil
        viewDidLoad()
    }
}


//    func enableLetterTap() {
//        if letterCount > 0 {
//            letterTap.isEnabled = true
//        }
//    }

