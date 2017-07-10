//
//  Geometry.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 7/10/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SceneKit
import UIKit
import QuartzCore

extension GameViewController {
    
    func loadGeometry() {
        
        // TODO:  has to be a way to prevent nodes shared geo from
        //  both being affected by material change to prevent this
        // duplication.  -- tried .copy but had trouble. try again later
        
        aGeo = Letter(letter: "A")
        bGeo = Letter(letter: "B")
        cGeo = Letter(letter: "C")
        dGeo = Letter(letter: "D")
        eGeo = Letter(letter: "E")
        fGeo = Letter(letter: "F")
        gGeo = Letter(letter: "G")
        hGeo = Letter(letter: "H")
        iGeo = Letter(letter: "I")
        jGeo = Letter(letter: "J")
        kGeo = Letter(letter: "K")
        lGeo = Letter(letter: "L")
        mGeo = Letter(letter: "M")
        nGeo = Letter(letter: "N")
        oGeo = Letter(letter: "O")
        pGeo = Letter(letter: "P")
        qGeo = Letter(letter: "Q")
        rGeo = Letter(letter: "R")
        sGeo = Letter(letter: "S")
        tGeo = Letter(letter: "T")
        uGeo = Letter(letter: "U")
        vGeo = Letter(letter: "V")
        wGeo = Letter(letter: "W")
        xGeo = Letter(letter: "X")
        yGeo = Letter(letter: "Y")
        zGeo = Letter(letter: "Z")
        
        aGeoF = Letter(letter: "A")
        bGeoF = Letter(letter: "B")
        cGeoF = Letter(letter: "C")
        dGeoF = Letter(letter: "D")
        eGeoF = Letter(letter: "E")
        fGeoF = Letter(letter: "F")
        gGeoF = Letter(letter: "G")
        hGeoF = Letter(letter: "H")
        iGeoF = Letter(letter: "I")
        jGeoF = Letter(letter: "J")
        kGeoF = Letter(letter: "K")
        lGeoF = Letter(letter: "L")
        mGeoF = Letter(letter: "M")
        nGeoF = Letter(letter: "N")
        oGeoF = Letter(letter: "O")
        pGeoF = Letter(letter: "P")
        qGeoF = Letter(letter: "Q")
        rGeoF = Letter(letter: "R")
        sGeoF = Letter(letter: "S")
        tGeoF = Letter(letter: "T")
        uGeoF = Letter(letter: "U")
        vGeoF = Letter(letter: "V")
        wGeoF = Letter(letter: "W")
        xGeoF = Letter(letter: "X")
        yGeoF = Letter(letter: "Y")
        zGeoF = Letter(letter: "Z")
    }
    
}
