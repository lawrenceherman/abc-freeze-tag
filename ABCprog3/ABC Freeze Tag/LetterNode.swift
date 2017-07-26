//
//  HomeNode.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 7/8/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

//import UIKit
//import QuartzCore
import SceneKit

class LetterNode: SCNNode {
    
    var frozen: Bool
    var frozenPosition: SCNVector3?
    var string: String!
    var corNode: LetterNode?
//    var letterPlayer: SCNAudioSource
    
//    func playLetter() {
//        
//        SCNAction.playAudio(letterPlayer, waitForCompletion: true)
//        
//    }
    
    init(geometry: Letter, frozen: Bool) {
        self.frozen = frozen
        self.string = geometry.string as! String
        
//        self.letterPlayer = SCNAudioSource(fileNamed: "ABC SKYLARA1.mp3")
        
//        self.letterPlayer = SCNAudioSource(named: "Sounds/ABC SKYLARA1.mp3")!
        
    
      
        super.init()
        self.geometry = geometry
        
        if frozen == true {
            self.geometry?.firstMaterial?.diffuse.contents = UIColor.white
            self.isHidden = true
            
        } else {
            switch string {
            case "F", "D", "K", "P", "T", "Y":
                self.geometry?.firstMaterial?.diffuse.contents = UIColor.red
            case "B", "G", "L", "Q", "V":
                self.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
            case "C", "H", "M", "R", "W", "Z":
                self.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
            case "A", "E", "I", "O", "U":
                self.geometry?.firstMaterial?.diffuse.contents = UIColor.green
            case "J", "N", "S", "X":
                self.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
            default:
                self.geometry?.firstMaterial?.diffuse.contents = UIColor.red
            }
            
        }
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
