//
//  NodesExt.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 7/10/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SceneKit
import AVFoundation

extension GameScene {
    
    func randomStartingPosition() -> SCNVector3 {
        let x = Float(arc4random_uniform(250))
        let y = Float(-2)
        let z = Float(arc4random_uniform(175))
        
        return SCNVector3Make(x, y, z)
    }
    
    func loadNodesFree() {
        
        aNodeFree = LetterNode(geometry: aGeo, frozen: false, audioSource: aSound)
        aNodeFree.position = randomStartingPosition()
        aNodeFree.frozenPosition = aNodeFrozen.position
        freeArray.append(aNodeFree)
        self.rootNode.addChildNode(aNodeFree)
        
        bNodeFree = LetterNode(geometry: bGeo, frozen: false, audioSource: bSound)
        bNodeFree.position = randomStartingPosition()
        bNodeFree.frozenPosition = bNodeFrozen.position
        freeArray.append(bNodeFree)
        self.rootNode.addChildNode(bNodeFree)
        
        cNodeFree = LetterNode(geometry: cGeo, frozen: false, audioSource: cSound)
        cNodeFree.position = randomStartingPosition()
        cNodeFree.frozenPosition = cNodeFrozen.position
        freeArray.append(cNodeFree)
        self.rootNode.addChildNode(cNodeFree)
        
        dNodeFree = LetterNode(geometry: dGeo, frozen: false, audioSource: dSound)
        dNodeFree.position = randomStartingPosition()
        dNodeFree.frozenPosition = dNodeFrozen.position
        freeArray.append(dNodeFree)
        self.rootNode.addChildNode(dNodeFree)
        
        eNodeFree = LetterNode(geometry: eGeo, frozen: false, audioSource: eSound)
        eNodeFree.position = randomStartingPosition()
        eNodeFree.frozenPosition = eNodeFrozen.position
        freeArray.append(eNodeFree)
        self.rootNode.addChildNode(eNodeFree)
        
        fNodeFree = LetterNode(geometry: fGeo, frozen: false, audioSource: fSound)
        fNodeFree.position = randomStartingPosition()
        fNodeFree.frozenPosition = fNodeFrozen.position
        freeArray.append(fNodeFree)
        self.rootNode.addChildNode(fNodeFree)
        
        gNodeFree = LetterNode(geometry: gGeo, frozen: false, audioSource: gSound)
        gNodeFree.position = randomStartingPosition()
        gNodeFree.frozenPosition = gNodeFrozen.position
        freeArray.append(gNodeFree)
        self.rootNode.addChildNode(gNodeFree)
        
        hNodeFree = LetterNode(geometry: hGeo, frozen: false, audioSource: hSound)
        hNodeFree.position = randomStartingPosition()
        hNodeFree.frozenPosition = hNodeFrozen.position
        freeArray.append(hNodeFree)
        self.rootNode.addChildNode(hNodeFree)
        
        iNodeFree = LetterNode(geometry: iGeo, frozen: false, audioSource: iSound)
        iNodeFree.position = randomStartingPosition()
        iNodeFree.frozenPosition = iNodeFrozen.position
        freeArray.append(iNodeFree)
        self.rootNode.addChildNode(iNodeFree)
        
        jNodeFree = LetterNode(geometry: jGeo, frozen: false, audioSource: jSound)
        jNodeFree.position = randomStartingPosition()
        jNodeFree.frozenPosition = jNodeFrozen.position
        freeArray.append(jNodeFree)
        self.rootNode.addChildNode(jNodeFree)
        
        kNodeFree = LetterNode(geometry: kGeo, frozen: false, audioSource: kSound)
        kNodeFree.position = randomStartingPosition()
        kNodeFree.frozenPosition = kNodeFrozen.position
        freeArray.append(kNodeFree)
        self.rootNode.addChildNode(kNodeFree)
        
        lNodeFree = LetterNode(geometry: lGeo, frozen: false, audioSource: lSound)
        lNodeFree.position = randomStartingPosition()
        lNodeFree.frozenPosition = lNodeFrozen.position
        freeArray.append(lNodeFree)
        self.rootNode.addChildNode(lNodeFree)
        
        mNodeFree = LetterNode(geometry: mGeo, frozen: false, audioSource: mSound)
        mNodeFree.position = randomStartingPosition()
        mNodeFree.frozenPosition = mNodeFrozen.position
        freeArray.append(mNodeFree)
        self.rootNode.addChildNode(mNodeFree)
        
        nNodeFree = LetterNode(geometry: nGeo, frozen: false, audioSource: nSound)
        nNodeFree.position = randomStartingPosition()
        nNodeFree.frozenPosition = nNodeFrozen.position
        freeArray.append(nNodeFree)
        self.rootNode.addChildNode(nNodeFree)
        
        oNodeFree = LetterNode(geometry: oGeo, frozen: false, audioSource: oSound)
        oNodeFree.position = randomStartingPosition()
        oNodeFree.frozenPosition = oNodeFrozen.position
        freeArray.append(oNodeFree)
        self.rootNode.addChildNode(oNodeFree)
        
        pNodeFree = LetterNode(geometry: pGeo, frozen: false, audioSource: pSound)
        pNodeFree.position = randomStartingPosition()
        pNodeFree.frozenPosition = pNodeFrozen.position
        freeArray.append(pNodeFree)
        self.rootNode.addChildNode(pNodeFree)
        
        qNodeFree = LetterNode(geometry: qGeo, frozen: false, audioSource: qSound)
        qNodeFree.position = randomStartingPosition()
        qNodeFree.frozenPosition = qNodeFrozen.position
        freeArray.append(qNodeFree)
        self.rootNode.addChildNode(qNodeFree)
        
        rNodeFree = LetterNode(geometry: rGeo, frozen: false, audioSource: rSound)
        rNodeFree.position = randomStartingPosition()
        rNodeFree.frozenPosition = rNodeFrozen.position
        freeArray.append(rNodeFree)
        self.rootNode.addChildNode(rNodeFree)
        
        sNodeFree = LetterNode(geometry: sGeo, frozen: false, audioSource: sSound)
        sNodeFree.position = randomStartingPosition()
        sNodeFree.frozenPosition = sNodeFrozen.position
        freeArray.append(sNodeFree)
        self.rootNode.addChildNode(sNodeFree)
        
        tNodeFree = LetterNode(geometry: tGeo, frozen: false, audioSource: tSound)
        tNodeFree.position = randomStartingPosition()
        tNodeFree.frozenPosition = tNodeFrozen.position
        freeArray.append(tNodeFree)
        self.rootNode.addChildNode(tNodeFree)
        
        uNodeFree = LetterNode(geometry: uGeo, frozen: false, audioSource: uSound)
        uNodeFree.position = randomStartingPosition()
        uNodeFree.frozenPosition = uNodeFrozen.position
        freeArray.append(uNodeFree)
        self.rootNode.addChildNode(uNodeFree)
        
        vNodeFree = LetterNode(geometry: vGeo, frozen: false, audioSource: vSound)
        vNodeFree.position = randomStartingPosition()
        vNodeFree.frozenPosition = vNodeFrozen.position
        freeArray.append(vNodeFree)
        self.rootNode.addChildNode(vNodeFree)
        
        wNodeFree = LetterNode(geometry: wGeo, frozen: false, audioSource: wSound)
        wNodeFree.position = randomStartingPosition()
        wNodeFree.frozenPosition = wNodeFrozen.position
        freeArray.append(wNodeFree)
        self.rootNode.addChildNode(wNodeFree)
        
        xNodeFree = LetterNode(geometry: xGeo, frozen: false, audioSource: xSound)
        xNodeFree.position = randomStartingPosition()
        xNodeFree.frozenPosition = xNodeFrozen.position
        freeArray.append(xNodeFree)
        self.rootNode.addChildNode(xNodeFree)
        
        yNodeFree = LetterNode(geometry: yGeo, frozen: false, audioSource: ySound)
        yNodeFree.position = randomStartingPosition()
        yNodeFree.frozenPosition = yNodeFrozen.position
        freeArray.append(yNodeFree)
        self.rootNode.addChildNode(yNodeFree)
        
        zNodeFree = LetterNode(geometry: zGeo, frozen: false, audioSource: zSound)
        zNodeFree.position = randomStartingPosition()
        zNodeFree.frozenPosition = zNodeFrozen.position
        freeArray.append(zNodeFree)
        self.rootNode.addChildNode(zNodeFree)
        
    }
    
    func loadNodesFrozen() {
        

        aNodeFrozen = LetterNode(geometry: aGeoF, frozen: true)
        aNodeFrozen.position = SCNVector3(0, 50, 0)
        frozenArray.append(aNodeFrozen)
        self.rootNode.addChildNode(aNodeFrozen)
        
        bNodeFrozen = LetterNode(geometry: bGeoF, frozen: true)
        bNodeFrozen.position = SCNVector3(17, 50, 0)
        frozenArray.append(bNodeFrozen)
        self.rootNode.addChildNode(bNodeFrozen)
        
        cNodeFrozen = LetterNode(geometry: cGeoF, frozen: true)
        cNodeFrozen.position = SCNVector3(34, 50, 0)
        frozenArray.append(cNodeFrozen)
        self.rootNode.addChildNode(cNodeFrozen)
        
        dNodeFrozen = LetterNode(geometry: dGeoF, frozen: true)
        dNodeFrozen.position = SCNVector3(51, 50, 0)
        frozenArray.append(dNodeFrozen)
        self.rootNode.addChildNode(dNodeFrozen)
        
        eNodeFrozen = LetterNode(geometry: eGeoF, frozen: true)
        eNodeFrozen.position = SCNVector3(68, 50, 0)
        frozenArray.append(eNodeFrozen)
        self.rootNode.addChildNode(eNodeFrozen)
        
        fNodeFrozen = LetterNode(geometry: fGeoF, frozen: true)
        fNodeFrozen.position = SCNVector3(85, 50, 0)
        frozenArray.append(fNodeFrozen)
        self.rootNode.addChildNode(fNodeFrozen)
        
        gNodeFrozen = LetterNode(geometry: gGeoF, frozen: true)
        gNodeFrozen.position = SCNVector3(101, 50, 0)
        frozenArray.append(gNodeFrozen)
        self.rootNode.addChildNode(gNodeFrozen)
        
        hNodeFrozen = LetterNode(geometry: hGeoF, frozen: true)
        hNodeFrozen.position = SCNVector3(119, 50, 0)
        frozenArray.append(hNodeFrozen)
        self.rootNode.addChildNode(hNodeFrozen)
        
        iNodeFrozen = LetterNode(geometry: iGeoF, frozen: true)
        iNodeFrozen.position = SCNVector3(139, 50, 0)
        frozenArray.append(iNodeFrozen)
        self.rootNode.addChildNode(iNodeFrozen)
        
        jNodeFrozen = LetterNode(geometry: jGeoF, frozen: true)
        jNodeFrozen.position = SCNVector3(153, 50, 0)
        frozenArray.append(jNodeFrozen)
        self.rootNode.addChildNode(jNodeFrozen)
        
        kNodeFrozen = LetterNode(geometry: kGeoF, frozen: true)
        kNodeFrozen.position = SCNVector3(169, 50, 0)
        frozenArray.append(kNodeFrozen)
        self.rootNode.addChildNode(kNodeFrozen)
        
        lNodeFrozen = LetterNode(geometry: lGeoF, frozen: true)
        lNodeFrozen.position = SCNVector3(187, 50, 0)
        frozenArray.append(lNodeFrozen)
        self.rootNode.addChildNode(lNodeFrozen)
        
        mNodeFrozen = LetterNode(geometry: mGeoF, frozen: true)
        mNodeFrozen.position = SCNVector3(204, 50, 0)
        frozenArray.append(mNodeFrozen)
        self.rootNode.addChildNode(mNodeFrozen)
        
        nNodeFrozen = LetterNode(geometry: nGeoF, frozen: true)
        nNodeFrozen.position = SCNVector3(221, 50, 0)
        frozenArray.append(nNodeFrozen)
        self.rootNode.addChildNode(nNodeFrozen)
        
        oNodeFrozen = LetterNode(geometry: oGeoF, frozen: true)
        oNodeFrozen.position = SCNVector3(238, 50, 0)
        frozenArray.append(oNodeFrozen)
        self.rootNode.addChildNode(oNodeFrozen)
        
        pNodeFrozen = LetterNode(geometry: pGeoF, frozen: true)
        pNodeFrozen.position = SCNVector3(255, 50, 0)
        frozenArray.append(pNodeFrozen)
        self.rootNode.addChildNode(pNodeFrozen)
        
        qNodeFrozen = LetterNode(geometry: qGeoF, frozen: true)
        qNodeFrozen.position = SCNVector3(40, 20, 0)
        frozenArray.append(qNodeFrozen)
        self.rootNode.addChildNode(qNodeFrozen)
        
        rNodeFrozen = LetterNode(geometry: rGeoF, frozen: true)
        rNodeFrozen.position = SCNVector3(60, 20, 0)
        frozenArray.append(rNodeFrozen)
        self.rootNode.addChildNode(rNodeFrozen)
        
        sNodeFrozen = LetterNode(geometry: sGeoF, frozen: true)
        sNodeFrozen.position = SCNVector3(80, 20, 0)
        frozenArray.append(sNodeFrozen)
        self.rootNode.addChildNode(sNodeFrozen)
        
        tNodeFrozen = LetterNode(geometry: tGeoF, frozen: true)
        tNodeFrozen.position = SCNVector3(100, 20, 0)
        frozenArray.append(tNodeFrozen)
        self.rootNode.addChildNode(tNodeFrozen)
        
        uNodeFrozen = LetterNode(geometry: uGeoF, frozen: true)
        uNodeFrozen.position = SCNVector3(120, 20, 0)
        frozenArray.append(uNodeFrozen)
        self.rootNode.addChildNode(uNodeFrozen)
        
        vNodeFrozen = LetterNode(geometry: vGeoF, frozen: true)
        vNodeFrozen.position = SCNVector3(140, 20, 0)
        frozenArray.append(vNodeFrozen)
        self.rootNode.addChildNode(vNodeFrozen)
        
        wNodeFrozen = LetterNode(geometry: wGeoF, frozen: true)
        wNodeFrozen.position = SCNVector3(160, 20, 0)
        frozenArray.append(wNodeFrozen)
        self.rootNode.addChildNode(wNodeFrozen)
        
        xNodeFrozen = LetterNode(geometry: xGeoF, frozen: true)
        xNodeFrozen.position = SCNVector3(180, 20, 0)
        frozenArray.append(xNodeFrozen)
        self.rootNode.addChildNode(xNodeFrozen)
        
        yNodeFrozen = LetterNode(geometry: yGeoF, frozen: true)
        yNodeFrozen.position = SCNVector3(200, 20, 0)
        frozenArray.append(yNodeFrozen)
        self.rootNode.addChildNode(yNodeFrozen)
        
        zNodeFrozen = LetterNode(geometry: zGeoF, frozen: true)
        zNodeFrozen.position = SCNVector3(220, 20, 0)
        frozenArray.append(zNodeFrozen)
        self.rootNode.addChildNode(zNodeFrozen)
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
