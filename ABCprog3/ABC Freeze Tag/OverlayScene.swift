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
    
    override init(size: CGSize) {
        super.init(size: size)
    
    
//        playNode = SKSpriteNode(imageNamed: "PlayActive.png")
        
    
        stopNode = SKSpriteNode(imageNamed: "Stop100.png")
        
        
//        let playActive = SKTexture(imageNamed: "PlayActive100.png")
//        playNode = SKSpriteNode(texture: playActive, size: CGSize(width: 100, height: 100))
        
        playNode = SKSpriteNode(imageNamed: "PlayActive100.png")

    
        self.addChild(playNode)
        self.addChild(stopNode)
    
    
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    
    
    
}

