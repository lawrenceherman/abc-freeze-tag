//
//  NodesExt.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 7/10/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SceneKit
////import UIKit
//import QuartzCore


extension GameViewController {
    
    func randomStartingPosition() -> SCNVector3 {
        
        let x = Float(arc4random_uniform(250))
        let y = Float(0)
        let z = Float(arc4random_uniform(175))
        
        return SCNVector3Make(x, y, z)
    }
    
    func loadNodesFree() {
        
        
        // TODO: Add subtle animations
        
        
        aNodeFree = LetterNode(geometry: aGeo, frozen: false)
        aNodeFree.position = randomStartingPosition()
        aNodeFree.frozenPosition = aNodeFrozen.position
        freeArray.append(aNodeFree)
//        aNodeFree.physicsBody?.contactTestBitMask = 1
        scene.rootNode.addChildNode(aNodeFree)
        
        bNodeFree = LetterNode(geometry: bGeo, frozen: false)
        bNodeFree.position = randomStartingPosition()
        bNodeFree.frozenPosition = bNodeFrozen.position
        freeArray.append(bNodeFree)
//       bNodeFree.physicsBody?.contactTestBitMask = 1
        scene.rootNode.addChildNode(bNodeFree)
        
        cNodeFree = LetterNode(geometry: cGeo, frozen: false)
        cNodeFree.position = randomStartingPosition()
        cNodeFree.frozenPosition = cNodeFrozen.position
        freeArray.append(cNodeFree)
//        cNodeFree.physicsBody?.contactTestBitMask = 1
        scene.rootNode.addChildNode(cNodeFree)
        
        dNodeFree = LetterNode(geometry: dGeo, frozen: false)
        dNodeFree.position = randomStartingPosition()
        dNodeFree.frozenPosition = dNodeFrozen.position
        freeArray.append(dNodeFree)
//        dNodeFree.physicsBody?.contactTestBitMask = 1
        scene.rootNode.addChildNode(dNodeFree)
        
        eNodeFree = LetterNode(geometry: eGeo, frozen: false)
        eNodeFree.position = randomStartingPosition()
        eNodeFree.frozenPosition = eNodeFrozen.position
        freeArray.append(eNodeFree)
//        dNodeFree.physicsBody?.contactTestBitMask = 1
        scene.rootNode.addChildNode(eNodeFree)
        
        fNodeFree = LetterNode(geometry: fGeo, frozen: false)
        fNodeFree.position = randomStartingPosition()
        fNodeFree.frozenPosition = fNodeFrozen.position
        freeArray.append(fNodeFree)
//        fNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(fNodeFree)
        
        gNodeFree = LetterNode(geometry: gGeo, frozen: false)
        gNodeFree.position = randomStartingPosition()
        gNodeFree.frozenPosition = gNodeFrozen.position
        freeArray.append(gNodeFree)
//        gNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(gNodeFree)
        
        hNodeFree = LetterNode(geometry: hGeo, frozen: false)
        hNodeFree.position = randomStartingPosition()
        hNodeFree.frozenPosition = hNodeFrozen.position
        freeArray.append(hNodeFree)
//        hNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(hNodeFree)
        
        iNodeFree = LetterNode(geometry: iGeo, frozen: false)
        iNodeFree.position = randomStartingPosition()
        iNodeFree.frozenPosition = iNodeFrozen.position
        freeArray.append(iNodeFree)
//        iNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(iNodeFree)
        
        jNodeFree = LetterNode(geometry: jGeo, frozen: false)
        jNodeFree.position = randomStartingPosition()
        jNodeFree.frozenPosition = jNodeFrozen.position
        freeArray.append(jNodeFree)
//        jNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(jNodeFree)
        
        kNodeFree = LetterNode(geometry: kGeo, frozen: false)
        kNodeFree.position = randomStartingPosition()
        kNodeFree.frozenPosition = kNodeFrozen.position
        freeArray.append(kNodeFree)
//        kNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(kNodeFree)
        
        lNodeFree = LetterNode(geometry: lGeo, frozen: false)
        lNodeFree.position = randomStartingPosition()
        lNodeFree.frozenPosition = lNodeFrozen.position
        freeArray.append(lNodeFree)
//        lNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(lNodeFree)
        
        mNodeFree = LetterNode(geometry: mGeo, frozen: false)
        mNodeFree.position = randomStartingPosition()
        mNodeFree.frozenPosition = mNodeFrozen.position
        freeArray.append(mNodeFree)
        scene.rootNode.addChildNode(mNodeFree)
        
        nNodeFree = LetterNode(geometry: nGeo, frozen: false)
        nNodeFree.position = randomStartingPosition()
        nNodeFree.frozenPosition = nNodeFrozen.position
        freeArray.append(nNodeFree)
        scene.rootNode.addChildNode(nNodeFree)
        
        oNodeFree = LetterNode(geometry: oGeo, frozen: false)
        oNodeFree.position = randomStartingPosition()
        oNodeFree.frozenPosition = oNodeFrozen.position
        freeArray.append(oNodeFree)
        scene.rootNode.addChildNode(oNodeFree)
        
        pNodeFree = LetterNode(geometry: pGeo, frozen: false)
        pNodeFree.position = randomStartingPosition()
        pNodeFree.frozenPosition = pNodeFrozen.position
        freeArray.append(pNodeFree)
        scene.rootNode.addChildNode(pNodeFree)
        
        qNodeFree = LetterNode(geometry: qGeo, frozen: false)
        qNodeFree.position = randomStartingPosition()
        qNodeFree.frozenPosition = qNodeFrozen.position
        freeArray.append(qNodeFree)
        scene.rootNode.addChildNode(qNodeFree)
        
        rNodeFree = LetterNode(geometry: rGeo, frozen: false)
        rNodeFree.position = randomStartingPosition()
        rNodeFree.frozenPosition = rNodeFrozen.position
        freeArray.append(rNodeFree)
        scene.rootNode.addChildNode(rNodeFree)
        
        sNodeFree = LetterNode(geometry: sGeo, frozen: false)
        sNodeFree.position = randomStartingPosition()
        sNodeFree.frozenPosition = sNodeFrozen.position
        freeArray.append(sNodeFree)
        scene.rootNode.addChildNode(sNodeFree)
        
        tNodeFree = LetterNode(geometry: tGeo, frozen: false)
        tNodeFree.position = randomStartingPosition()
        tNodeFree.frozenPosition = tNodeFrozen.position
        freeArray.append(tNodeFree)
        scene.rootNode.addChildNode(tNodeFree)
        
        uNodeFree = LetterNode(geometry: uGeo, frozen: false)
        uNodeFree.position = randomStartingPosition()
        uNodeFree.frozenPosition = uNodeFrozen.position
        freeArray.append(uNodeFree)
        scene.rootNode.addChildNode(uNodeFree)
        
        vNodeFree = LetterNode(geometry: vGeo, frozen: false)
        vNodeFree.position = randomStartingPosition()
        vNodeFree.frozenPosition = vNodeFrozen.position
        freeArray.append(vNodeFree)
        scene.rootNode.addChildNode(vNodeFree)
        
        wNodeFree = LetterNode(geometry: wGeo, frozen: false)
        wNodeFree.position = randomStartingPosition()
        wNodeFree.frozenPosition = wNodeFrozen.position
        freeArray.append(wNodeFree)
        scene.rootNode.addChildNode(wNodeFree)
        
        xNodeFree = LetterNode(geometry: xGeo, frozen: false)
        xNodeFree.position = randomStartingPosition()
        xNodeFree.frozenPosition = xNodeFrozen.position
        freeArray.append(xNodeFree)
        scene.rootNode.addChildNode(xNodeFree)
        
        yNodeFree = LetterNode(geometry: yGeo, frozen: false)
        yNodeFree.position = randomStartingPosition()
        yNodeFree.frozenPosition = yNodeFrozen.position
        freeArray.append(yNodeFree)
        scene.rootNode.addChildNode(yNodeFree)
        
        zNodeFree = LetterNode(geometry: zGeo, frozen: false)
        zNodeFree.position = randomStartingPosition()
        zNodeFree.frozenPosition = zNodeFrozen.position
        freeArray.append(zNodeFree)
        scene.rootNode.addChildNode(zNodeFree)
        
        
    }
    
    func loadNodesFrozen() {
        
        aNodeFrozen = LetterNode(geometry: aGeoF, frozen: true)
        aNodeFrozen.position = SCNVector3(0, 50, 0)
        frozenArray.append(aNodeFrozen)
        scene.rootNode.addChildNode(aNodeFrozen)
        
        bNodeFrozen = LetterNode(geometry: bGeoF, frozen: true)
        bNodeFrozen.position = SCNVector3(17, 50, 0)
        frozenArray.append(bNodeFrozen)
        scene.rootNode.addChildNode(bNodeFrozen)
        
        cNodeFrozen = LetterNode(geometry: cGeoF, frozen: true)
        cNodeFrozen.position = SCNVector3(34, 50, 0)
        frozenArray.append(cNodeFrozen)
        scene.rootNode.addChildNode(cNodeFrozen)
        
        dNodeFrozen = LetterNode(geometry: dGeoF, frozen: true)
        dNodeFrozen.position = SCNVector3(51, 50, 0)
        frozenArray.append(dNodeFrozen)
        scene.rootNode.addChildNode(dNodeFrozen)
        
        eNodeFrozen = LetterNode(geometry: eGeoF, frozen: true)
        eNodeFrozen.position = SCNVector3(68, 50, 0)
        frozenArray.append(eNodeFrozen)
        scene.rootNode.addChildNode(eNodeFrozen)
        
        fNodeFrozen = LetterNode(geometry: fGeoF, frozen: true)
        fNodeFrozen.position = SCNVector3(85, 50, 0)
        frozenArray.append(fNodeFrozen)
        scene.rootNode.addChildNode(fNodeFrozen)
        
        gNodeFrozen = LetterNode(geometry: gGeoF, frozen: true)
        gNodeFrozen.position = SCNVector3(102, 50, 0)
        frozenArray.append(gNodeFrozen)
        scene.rootNode.addChildNode(gNodeFrozen)
        
        hNodeFrozen = LetterNode(geometry: hGeoF, frozen: true)
        hNodeFrozen.position = SCNVector3(119, 50, 0)
        frozenArray.append(hNodeFrozen)
        scene.rootNode.addChildNode(hNodeFrozen)
        
        iNodeFrozen = LetterNode(geometry: iGeoF, frozen: true)
        iNodeFrozen.position = SCNVector3(136, 50, 0)
        frozenArray.append(iNodeFrozen)
        scene.rootNode.addChildNode(iNodeFrozen)
        
        jNodeFrozen = LetterNode(geometry: jGeoF, frozen: true)
        jNodeFrozen.position = SCNVector3(153, 50, 0)
        frozenArray.append(jNodeFrozen)
        scene.rootNode.addChildNode(jNodeFrozen)
        
        kNodeFrozen = LetterNode(geometry: kGeoF, frozen: true)
        kNodeFrozen.position = SCNVector3(170, 50, 0)
        frozenArray.append(kNodeFrozen)
        scene.rootNode.addChildNode(kNodeFrozen)
        
        lNodeFrozen = LetterNode(geometry: lGeoF, frozen: true)
        lNodeFrozen.position = SCNVector3(187, 50, 0)
        frozenArray.append(lNodeFrozen)
        scene.rootNode.addChildNode(lNodeFrozen)
        
        mNodeFrozen = LetterNode(geometry: mGeoF, frozen: true)
        mNodeFrozen.position = SCNVector3(204, 50, 0)
        frozenArray.append(mNodeFrozen)
        scene.rootNode.addChildNode(mNodeFrozen)
        
        nNodeFrozen = LetterNode(geometry: nGeoF, frozen: true)
        nNodeFrozen.position = SCNVector3(221, 50, 0)
        frozenArray.append(nNodeFrozen)
        scene.rootNode.addChildNode(nNodeFrozen)
        
        oNodeFrozen = LetterNode(geometry: oGeoF, frozen: true)
        oNodeFrozen.position = SCNVector3(238, 50, 0)
        frozenArray.append(oNodeFrozen)
        scene.rootNode.addChildNode(oNodeFrozen)
        
        pNodeFrozen = LetterNode(geometry: pGeoF, frozen: true)
        pNodeFrozen.position = SCNVector3(255, 50, 0)
        frozenArray.append(pNodeFrozen)
        scene.rootNode.addChildNode(pNodeFrozen)
        
        qNodeFrozen = LetterNode(geometry: qGeoF, frozen: true)
        qNodeFrozen.position = SCNVector3(40, 20, 0)
        frozenArray.append(qNodeFrozen)
        scene.rootNode.addChildNode(qNodeFrozen)
        
        rNodeFrozen = LetterNode(geometry: rGeoF, frozen: true)
        rNodeFrozen.position = SCNVector3(60, 20, 0)
        frozenArray.append(rNodeFrozen)
        scene.rootNode.addChildNode(rNodeFrozen)
        
        sNodeFrozen = LetterNode(geometry: sGeoF, frozen: true)
        sNodeFrozen.position = SCNVector3(80, 20, 0)
        frozenArray.append(sNodeFrozen)
        scene.rootNode.addChildNode(sNodeFrozen)
        
        tNodeFrozen = LetterNode(geometry: tGeoF, frozen: true)
        tNodeFrozen.position = SCNVector3(100, 20, 0)
        frozenArray.append(tNodeFrozen)
        scene.rootNode.addChildNode(tNodeFrozen)
        
        uNodeFrozen = LetterNode(geometry: uGeoF, frozen: true)
        uNodeFrozen.position = SCNVector3(120, 20, 0)
        frozenArray.append(uNodeFrozen)
        scene.rootNode.addChildNode(uNodeFrozen)
        
        vNodeFrozen = LetterNode(geometry: vGeoF, frozen: true)
        vNodeFrozen.position = SCNVector3(140, 20, 0)
        frozenArray.append(vNodeFrozen)
        scene.rootNode.addChildNode(vNodeFrozen)
        
        wNodeFrozen = LetterNode(geometry: wGeoF, frozen: true)
        wNodeFrozen.position = SCNVector3(160, 20, 0)
        frozenArray.append(wNodeFrozen)
        scene.rootNode.addChildNode(wNodeFrozen)
        
        xNodeFrozen = LetterNode(geometry: xGeoF, frozen: true)
        xNodeFrozen.position = SCNVector3(180, 20, 0)
        frozenArray.append(xNodeFrozen)
        scene.rootNode.addChildNode(xNodeFrozen)
        
        yNodeFrozen = LetterNode(geometry: yGeoF, frozen: true)
        yNodeFrozen.position = SCNVector3(200, 20, 0)
        frozenArray.append(yNodeFrozen)
        scene.rootNode.addChildNode(yNodeFrozen)
        
        zNodeFrozen = LetterNode(geometry: zGeoF, frozen: true)
        zNodeFrozen.position = SCNVector3(220, 20, 0)
        frozenArray.append(zNodeFrozen)
        scene.rootNode.addChildNode(zNodeFrozen)
    }
    
    func makeFrozenNodesVisible() {
        
        aNodeFrozen.isHidden = false
        bNodeFrozen.isHidden = false
        cNodeFrozen.isHidden = false
        dNodeFrozen.isHidden = false
        eNodeFrozen.isHidden = false
        fNodeFrozen.isHidden = false
        gNodeFrozen.isHidden = false
        hNodeFrozen.isHidden = false
        iNodeFrozen.isHidden = false
        jNodeFrozen.isHidden = false
        kNodeFrozen.isHidden = false
        lNodeFrozen.isHidden = false
        mNodeFrozen.isHidden = false
        nNodeFrozen.isHidden = false
        oNodeFrozen.isHidden = false
        pNodeFrozen.isHidden = false
        qNodeFrozen.isHidden = false
        rNodeFrozen.isHidden = false
        sNodeFrozen.isHidden = false
        tNodeFrozen.isHidden = false
        uNodeFrozen.isHidden = false
        vNodeFrozen.isHidden = false
        wNodeFrozen.isHidden = false
        xNodeFrozen.isHidden = false
        yNodeFrozen.isHidden = false
        zNodeFrozen.isHidden = false
    }
    

    
}
