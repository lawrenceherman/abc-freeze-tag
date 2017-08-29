//
//  HomeNode.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 7/8/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SceneKit

class LetterNode: SCNNode {
    
    var frozen: Bool
    var frozenPosition: SCNVector3?
    var string: String!
    var corNode: LetterNode?
    var letterSound: SCNAudioSource?
    var letterWidth: Float!
    
    init(geometry: Letter, frozen: Bool) {
        
        self.frozen = frozen
        self.string = geometry.string as! String
        
        super.init()
        self.geometry = geometry
        
        self.letterWidth = self.boundingBox.max.x - self.boundingBox.min.x
        self.pivot.m41 += (self.letterWidth / 1.9)
        
        
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
    
    convenience init(geometry: Letter, frozen: Bool, audioSource: SCNAudioSource) {
        self.init(geometry: geometry, frozen: frozen)
        self.letterSound = audioSource
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
