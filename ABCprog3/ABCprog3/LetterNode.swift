//
//  HomeNode.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 7/8/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit


class LetterNode: SCNNode {
    
    var frozen: Bool
    
    
    init(geometry: Letter, frozen: Bool) {
        self.frozen = frozen
        
        super.init()
        self.geometry = geometry
        
        if frozen == true {
            self.geometry?.firstMaterial?.diffuse.contents = UIColor.white
//            if self.geometry.string == "A" {
//                
//            }
        } else {
            self.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
