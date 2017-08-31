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

class GameViewController: UIViewController, OverlaySceneDelegate, GameSceneDelegate {
    
    var gameView: SCNView!
    var gameScene: GameScene!
    var spriteScene: OverlayScene!
    var sceneEnabled: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView = self.view as! SCNView
        gameScene = GameScene()
        gameView.scene = gameScene
        gameScene.delegate = self
        
        spriteScene = OverlayScene(size: gameView.bounds.size)
        gameView.overlaySKScene = spriteScene
        spriteScene.overlayDelegate = self
        
        gameView.allowsCameraControl = false
        gameView.isPlaying = true
        gameView.showsStatistics = false
        gameView.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 1.0)
        gameView.autoenablesDefaultLighting = false
    
        layOut2DOverlay()

    }
    
    func layOut2DOverlay() {
        let playNodeX = Int(spriteScene.frame.width * 0.9)
        let playNodeY = Int(spriteScene.frame.height * 0.8)
        spriteScene.playNode.position = CGPoint(x: playNodeX, y: playNodeY)

        let stopNodeX = Int(spriteScene.frame.width * 0.1)
        let stopNodeY = Int(spriteScene.frame.height * 0.8)
        spriteScene.stopNode.position = CGPoint(x: stopNodeX, y: stopNodeY)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let location = touch?.location(in: gameView)
        let tappedNode: LetterNode!

        let hitResults = gameView.hitTest(location!, options: [SCNHitTestOption.boundingBoxOnly: true, SCNHitTestOption.clipToZRange: true])
        
        if sceneEnabled == true {
            if hitResults.first?.node is LetterNode
            {
                tappedNode = (hitResults.first?.node as! LetterNode)
                if tappedNode.frozenPosition != nil && tappedNode.frozen == false {
                    tappedNode.frozen = true
                    sceneEnabled = false
                    gameScene.nodeCaughtAnimation(node: tappedNode)
                }
                
            } else { gameScene.randomMissSound() }
        }
    }
    
    func enableScene() {
        sceneEnabled = true
    }
    
    func disableScene() {
        sceneEnabled = false
    }
    
    func startGame() {
        gameScene.rootNode.runAction(gameScene.startPlayAudio(), completionHandler: {
            self.gameScene.gameSceneStart()
            self.sceneEnabled = true
        })
    }
    
    func stopGame() {
        sceneEnabled = false
        gameScene.rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode() }
        gameScene.rootNode.removeAllAudioPlayers()
        gameScene.frozenArray = []
        gameScene.freeArray = []
        gameScene.letterCount = 26
        gameView.overlaySKScene = nil
        viewDidLoad()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if sceneEnabled == true {
            let previousValue = touches.first!.previousLocation(in: self.view)
            let currentValue = touches.first!.location(in: self.view)
            let difference = Float(currentValue.x) - Float(previousValue.x)
            var eulerVector = gameScene.cameraNode.eulerAngles
            eulerVector.y = eulerVector.y + (difference/100)
            gameScene.cameraNode.eulerAngles = eulerVector
        }
    }
}



