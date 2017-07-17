//
//  NodesExt.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 7/10/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SceneKit
import UIKit
import QuartzCore


extension GameViewController {
    
  
    
    
    func randomStartingPosition() -> SCNVector3 {
        
        let x = Float(arc4random_uniform(250))
        let y = Float(0)
        let z = Float(arc4random_uniform(175))
        
        return SCNVector3Make(x, y, z)
    }
    
    func loadNodesFree() {
        
        // TODO: create function to randomly generate starting position
        // TODO: Add subtle animations
        
        //        let physicsBody = SCNPhysicsBody.dynamic()
        
        
        
        aNodeFree = LetterNode(geometry: aGeo, frozen: false)
        aNodeFree.position = randomStartingPosition()
        aNodeFree.frozenPosition = aNodeFrozen.position
//        aNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(aNodeFree)
        
        bNodeFree = LetterNode(geometry: bGeo, frozen: false)
        bNodeFree.position = randomStartingPosition()
        bNodeFree.frozenPosition = bNodeFrozen.position
        scene.rootNode.addChildNode(bNodeFree)
        
        cNodeFree = LetterNode(geometry: cGeo, frozen: false)
        cNodeFree.position = randomStartingPosition()
        cNodeFree.frozenPosition = cNodeFrozen.position
        //        cNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(cNodeFree)
        
        dNodeFree = LetterNode(geometry: dGeo, frozen: false)
        dNodeFree.position = randomStartingPosition()
        dNodeFree.frozenPosition = dNodeFrozen.position
        scene.rootNode.addChildNode(dNodeFree)
        
        eNodeFree = LetterNode(geometry: eGeo, frozen: false)
        eNodeFree.position = randomStartingPosition()
        eNodeFree.frozenPosition = eNodeFrozen.position
        scene.rootNode.addChildNode(eNodeFree)
        
        fNodeFree = LetterNode(geometry: fGeo, frozen: false)
        fNodeFree.position = randomStartingPosition()
        fNodeFree.frozenPosition = fNodeFrozen.position
        scene.rootNode.addChildNode(fNodeFree)
        
        gNodeFree = LetterNode(geometry: gGeo, frozen: false)
        gNodeFree.position = randomStartingPosition()
        gNodeFree.frozenPosition = gNodeFrozen.position
        scene.rootNode.addChildNode(gNodeFree)
        
        hNodeFree = LetterNode(geometry: hGeo, frozen: false)
        hNodeFree.position = randomStartingPosition()
        hNodeFree.frozenPosition = hNodeFrozen.position
        scene.rootNode.addChildNode(hNodeFree)
        
        iNodeFree = LetterNode(geometry: iGeo, frozen: false)
        iNodeFree.position = randomStartingPosition()
        iNodeFree.frozenPosition = iNodeFrozen.position
        scene.rootNode.addChildNode(iNodeFree)
        
        jNodeFree = LetterNode(geometry: jGeo, frozen: false)
        jNodeFree.position = randomStartingPosition()
        jNodeFree.frozenPosition = jNodeFrozen.position
        scene.rootNode.addChildNode(jNodeFree)
        
        kNodeFree = LetterNode(geometry: kGeo, frozen: false)
        kNodeFree.position = randomStartingPosition()
        kNodeFree.frozenPosition = kNodeFrozen.position
        scene.rootNode.addChildNode(kNodeFree)
        
        lNodeFree = LetterNode(geometry: lGeo, frozen: false)
        lNodeFree.position = randomStartingPosition()
        lNodeFree.frozenPosition = lNodeFrozen.position
        scene.rootNode.addChildNode(lNodeFree)
    }
    
    func loadNodesFrozen() {
        
        aNodeFrozen = LetterNode(geometry: aGeoF, frozen: true)
        aNodeFrozen.position = SCNVector3(0, 50, 0)
        scene.rootNode.addChildNode(aNodeFrozen)
        
        bNodeFrozen = LetterNode(geometry: bGeoF, frozen: true)
        bNodeFrozen.position = SCNVector3(17, 50, 0)
        scene.rootNode.addChildNode(bNodeFrozen)
        
        cNodeFrozen = LetterNode(geometry: cGeoF, frozen: true)
        cNodeFrozen.position = SCNVector3(34, 50, 0)
        scene.rootNode.addChildNode(cNodeFrozen)
        
        dNodeFrozen = LetterNode(geometry: dGeoF, frozen: true)
        dNodeFrozen.position = SCNVector3(51, 50, 0)
        scene.rootNode.addChildNode(dNodeFrozen)
        
        eNodeFrozen = LetterNode(geometry: eGeoF, frozen: true)
        eNodeFrozen.position = SCNVector3(68, 50, 0)
        scene.rootNode.addChildNode(eNodeFrozen)
        
        fNodeFrozen = LetterNode(geometry: fGeoF, frozen: true)
        fNodeFrozen.position = SCNVector3(85, 50, 0)
        scene.rootNode.addChildNode(fNodeFrozen)
        
        gNodeFrozen = LetterNode(geometry: gGeoF, frozen: true)
        gNodeFrozen.position = SCNVector3(102, 50, 0)
        scene.rootNode.addChildNode(gNodeFrozen)
        
        hNodeFrozen = LetterNode(geometry: hGeoF, frozen: true)
        hNodeFrozen.position = SCNVector3(119, 50, 0)
        scene.rootNode.addChildNode(hNodeFrozen)
        
        iNodeFrozen = LetterNode(geometry: iGeoF, frozen: true)
        iNodeFrozen.position = SCNVector3(136, 50, 0)
        scene.rootNode.addChildNode(iNodeFrozen)
        
        jNodeFrozen = LetterNode(geometry: jGeoF, frozen: true)
        jNodeFrozen.position = SCNVector3(153, 50, 0)
        scene.rootNode.addChildNode(jNodeFrozen)
        
        kNodeFrozen = LetterNode(geometry: kGeoF, frozen: true)
        kNodeFrozen.position = SCNVector3(170, 50, 0)
        scene.rootNode.addChildNode(kNodeFrozen)
        
        lNodeFrozen = LetterNode(geometry: lGeoF, frozen: true)
        lNodeFrozen.position = SCNVector3(187, 50, 0)
        scene.rootNode.addChildNode(lNodeFrozen)
        
        mNodeFrozen = LetterNode(geometry: mGeoF, frozen: true)
        mNodeFrozen.position = SCNVector3(204, 50, 0)
        scene.rootNode.addChildNode(mNodeFrozen)
        
        nNodeFrozen = LetterNode(geometry: nGeoF, frozen: true)
        nNodeFrozen.position = SCNVector3(221, 50, 0)
        scene.rootNode.addChildNode(nNodeFrozen)
        
        oNodeFrozen = LetterNode(geometry: oGeoF, frozen: true)
        oNodeFrozen.position = SCNVector3(238, 50, 0)
        scene.rootNode.addChildNode(oNodeFrozen)
        
        pNodeFrozen = LetterNode(geometry: pGeoF, frozen: true)
        pNodeFrozen.position = SCNVector3(255, 50, 0)
        scene.rootNode.addChildNode(pNodeFrozen)
        
        qNodeFrozen = LetterNode(geometry: qGeoF, frozen: true)
        qNodeFrozen.position = SCNVector3(40, 20, 0)
        scene.rootNode.addChildNode(qNodeFrozen)
        
        rNodeFrozen = LetterNode(geometry: rGeoF, frozen: true)
        rNodeFrozen.position = SCNVector3(60, 20, 0)
        scene.rootNode.addChildNode(rNodeFrozen)
        
        sNodeFrozen = LetterNode(geometry: sGeoF, frozen: true)
        sNodeFrozen.position = SCNVector3(80, 20, 0)
        scene.rootNode.addChildNode(sNodeFrozen)
        
        tNodeFrozen = LetterNode(geometry: tGeoF, frozen: true)
        tNodeFrozen.position = SCNVector3(100, 20, 0)
        scene.rootNode.addChildNode(tNodeFrozen)
        
        uNodeFrozen = LetterNode(geometry: uGeoF, frozen: true)
        uNodeFrozen.position = SCNVector3(120, 20, 0)
        scene.rootNode.addChildNode(uNodeFrozen)
        
        vNodeFrozen = LetterNode(geometry: vGeoF, frozen: true)
        vNodeFrozen.position = SCNVector3(140, 20, 0)
        scene.rootNode.addChildNode(vNodeFrozen)
        
        wNodeFrozen = LetterNode(geometry: wGeoF, frozen: true)
        wNodeFrozen.position = SCNVector3(160, 20, 0)
        scene.rootNode.addChildNode(wNodeFrozen)
        
        xNodeFrozen = LetterNode(geometry: xGeoF, frozen: true)
        xNodeFrozen.position = SCNVector3(180, 20, 0)
        scene.rootNode.addChildNode(xNodeFrozen)
        
        yNodeFrozen = LetterNode(geometry: yGeoF, frozen: true)
        yNodeFrozen.position = SCNVector3(200, 20, 0)
        scene.rootNode.addChildNode(yNodeFrozen)
        
        zNodeFrozen = LetterNode(geometry: zGeoF, frozen: true)
        zNodeFrozen.position = SCNVector3(220, 20, 0)
        scene.rootNode.addChildNode(zNodeFrozen)
    }
    

    
}
