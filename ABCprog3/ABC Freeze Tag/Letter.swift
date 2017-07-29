//
//  Letter.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 7/8/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SceneKit

class Letter: SCNText {
    
    init(letter: String) {
        super.init()
        self.string = letter
        self.extrusionDepth = 2.0
        self.font = UIFont.init(name: "Arial", size: 18.0)
        self.flatness = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


