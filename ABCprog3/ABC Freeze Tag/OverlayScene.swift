//
//  OverlayView.swift
//  ABC Freeze Tag
//
//  Created by Lawrence Herman on 8/1/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SpriteKit




class OverlayScene: SKScene {
    
    var playNode: SKSpriteNode!
    var stopNode: SKSpriteNode!
    var playNodeIsActive = true
    var playInactiveTexture: SKTexture!
    var stopInactiveTexture: SKTexture!
    var playActiveTexture: SKTexture!
    var stopActiveTexture: SKTexture!
    
    
    var gameViewController: GameViewController!
    
    
    
    override init(size: CGSize) {
        super.init(size: size)
        
        
        
        playActiveTexture = SKTexture(imageNamed: "PlayActive100.png")
        stopActiveTexture = SKTexture(imageNamed: "Stop100.png")
        playInactiveTexture = SKTexture(imageNamed: "PlayInactive100.png")
        stopInactiveTexture = SKTexture(imageNamed: "StopInactive100.png")
        
        
        playNode = SKSpriteNode(texture: playActiveTexture)
        stopNode = SKSpriteNode(texture: stopInactiveTexture)
        
        self.addChild(playNode)
        self.addChild(stopNode)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches ended")
        let touch = touches.first
        let location = touch?.location(in: self)
        
        if playNode.contains(location!) {
            print("playNodetapped")
            if playNodeIsActive {
                playNodeIsActive = false
                
                
                gameViewController.startGame()
                
                playNode.texture = playInactiveTexture
                stopNode.texture = stopActiveTexture
                gameViewController?.gameView.overlaySKScene = self
                
 //             print(playNode.texture)
            }
        }
        
        if stopNode.contains(location!) {
            if !playNodeIsActive {
                playNodeIsActive = true
                
                
                gameViewController.stopGame()
                
                playNode.texture = playActiveTexture
                stopNode.texture = stopInactiveTexture
                gameViewController?.gameView.overlaySKScene = self
            }
        }
    }
}

