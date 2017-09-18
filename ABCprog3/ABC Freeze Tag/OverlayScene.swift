//
//  OverlayView.swift
//  ABC Freeze Tag
//
//  Created by Lawrence Herman on 8/1/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SpriteKit

protocol OverlaySceneDelegate: class {
  func backButtonPressed()
}

class OverlayScene: SKScene {
  
  var backNode: SKSpriteNode!
  weak var overlayDelegate: OverlaySceneDelegate?
  
  override init(size: CGSize) {
    super.init(size: size)
    
    let backTexture = SKTexture(imageNamed: "BackButton")
    
    if UIDevice.current.userInterfaceIdiom == .phone {
      backNode = SKSpriteNode(texture: backTexture, size: CGSize(width: 50, height: 50))
    } else {
      backNode = SKSpriteNode(texture: backTexture, size: CGSize(width: 100, height: 100))
    }
    self.addChild(backNode)
    layOut()
  }
  
  func layOut() {
    let backNodeX = frame.width * 0.08
    let backNodeY = frame.height * 0.8
    backNode.position = CGPoint(x: backNodeX, y: backNodeY)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // If touch is on backbutton returns to load screen.  Else passes
  // touch to SceneView
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first
    let location = touch?.location(in: self)
    
    if backNode.contains(location!) {
      overlayDelegate?.backButtonPressed()
    }
    else {
      let hitResults = self.view?.hitTest(location!, with: event)
      hitResults?.next?.touchesBegan(touches, with: event)
    }
  }
  
  //Passes touchesMoved to gameView
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first
    let location = touch?.location(in: self)
    let hitResults = self.view?.hitTest(location!, with: event)
    hitResults?.next?.touchesMoved(touches, with: event)
  }
}


