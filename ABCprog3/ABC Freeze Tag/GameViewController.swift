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

class GameViewController: UIViewController, GameSceneDelegate {
    
    var gameView: SCNView!
    var gameScene: GameScene!
    var spriteScene: OverlayScene!
    var gameViewTap: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView = self.view as! SCNView
        gameScene = GameScene()
        gameView.scene = gameScene
        
        spriteScene = OverlayScene(size: gameView.bounds.size)
        spriteScene.gameViewController = self
        gameView.overlaySKScene = spriteScene
        
        gameScene.delegate = self
        gameView.allowsCameraControl = false
        gameView.showsStatistics = false
        gameView.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 1.0)
        gameView.autoenablesDefaultLighting = false
        
        layOut2DOverlay()
        
        gameViewTap = UITapGestureRecognizer(target: self, action: #selector(handleGameViewTap(_:)))
        gameView.addGestureRecognizer(gameViewTap)
        gameViewTap.isEnabled = false
        gameViewTap.cancelsTouchesInView = false
    }
    
    func layOut2DOverlay() {
        let playNodeX = Int(spriteScene.frame.width * 0.9)
        let playNodeY = Int(spriteScene.frame.height * 0.8)
        spriteScene.playNode.position = CGPoint(x: playNodeX, y: playNodeY)
        
        let stopNodeX = Int(spriteScene.frame.width * 0.1)
        let stopNodeY = Int(spriteScene.frame.height * 0.8)
        spriteScene.stopNode.position = CGPoint(x: stopNodeX, y: stopNodeY)
    }
    
    func enableGameViewTap() {
        gameViewTap.isEnabled = true
    }
    
    func disableGameViewTap() {
        gameViewTap.isEnabled = false
    }
    
    @objc func handleGameViewTap(_ gestureRecognizer:
        UITapGestureRecognizer) {
        
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



