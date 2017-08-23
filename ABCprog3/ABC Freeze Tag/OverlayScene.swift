//
//  OverlayView.swift
//  ABC Freeze Tag
//
//  Created by Lawrence Herman on 8/1/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SpriteKit

//protocol SKSceneDelegate: class{
//    func startGame()
//    func stopGame()
//}
protocol OverlaySceneDelegate: class {
    func startGame()
    func stopGame()
}

class OverlayScene: SKScene {
    
    var playNode: SKSpriteNode!
    var stopNode: SKSpriteNode!
    var playNodeIsActive = true
    var playInactiveTexture: SKTexture!
    var stopInactiveTexture: SKTexture!
    var playActiveTexture: SKTexture!
    var stopActiveTexture: SKTexture!
    weak var overlayDelegate: OverlaySceneDelegate?
    
    
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
        
        print("next responder in overlay \(next)")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        
        if playNode.contains(location!) || stopNode.contains(location!){
            if playNode.contains(location!) {
                print("playNode tapped /n/n")
                if playNodeIsActive {
                    print("inside playNode is Active")
                    playNodeIsActive = false
                    playNode.texture = playInactiveTexture
                    stopNode.texture = stopActiveTexture
                    overlayDelegate?.startGame()
                }
            }
            
            if stopNode.contains(location!) {
                print("stopNode tapped")
                if !playNodeIsActive {
                    playNodeIsActive = true
                    playNode.texture = playActiveTexture
                    stopNode.texture = stopInactiveTexture
                    overlayDelegate?.stopGame()
                }
            }
        } else {
            let hitResults = self.view?.hitTest(location!, with: event)
            hitResults?.next?.touchesBegan(touches, with: event)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(touches.description)
        
        let touch = touches.first
//        print(touch)
        let location = touch?.location(in: self)
        let hitResults = self.view?.hitTest(location!, with: event)
        hitResults?.next?.touchesMoved(touches, with: event)
    
    
    }


}


