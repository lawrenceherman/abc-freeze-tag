//
//  Letter.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 7/8/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit


class Letter: SCNText {
    
    init(letter: String) {
        super.init()
        self.string = letter
        self.extrusionDepth = 2.0
        self.font = UIFont.init(name: "Arial", size: 18.0)
        self.flatness = 0
        
//        switch letter {
//        case "F", "D", "K", "P", "T", "Y":
//            self.firstMaterial?.diffuse.contents = UIColor.red
//        case "B", "G", "L", "Q", "V":
//            self.firstMaterial?.diffuse.contents = UIColor.blue
//        case "C", "H", "M", "R", "W", "Z":
//            self.firstMaterial?.diffuse.contents = UIColor.yellow
//        case "A", "E", "I", "O", "U":
//            self.firstMaterial?.diffuse.contents = UIColor.green
//        case "J", "N", "S", "X":
//            self.firstMaterial?.diffuse.contents = UIColor.orange
//        default:
//            self.firstMaterial?.diffuse.contents = UIColor.red
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


