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
    
    
//    func loadNodesFree2() {
    
//        var array = [(aGeo, aNodeFree, aNodeFrozen), (bGeo,bNodeFree,bNodeFrozen), (cGeo, cNodeFree, cNodeFrozen)]
//        
////        array.forEach { (arg) in
////            arg.1 = LetterNode(geometry: arg.0, frozen: false)
////        }
//        
//        for i in array {
//            
//            let x = LetterNode(geometry: i.0, frozen: false)
//            
//            
//            
//            x.position = SCNVector3(x: 0, y: 0, z: 0)
//            x.frozenPosition = (
//            
//            
//        }
        
            
            
            
        
        
        
        
        
        
//    }
    
    func loadNodesFree() {

        // TODO: create function to randomly generate starting position
        // TODO: Add subtle animations

//        let physicsBody = SCNPhysicsBody.dynamic()
        


        aNodeFree = LetterNode(geometry: aGeoF, frozen: false)
        
        
        aNodeFree.position = SCNVector3(140, 0, 80)
        aNodeFree.frozenPosition = aNodeFrozen.position
        freeArray.append(aNodeFree)
        //        aNodeFree.physicsBody = physicsBody
        scene.rootNode.addChildNode(aNodeFree)

//        bNodeFree = LetterNode(geometry: bGeo.copy() as! Letter, frozen: false)
//        bNodeFree.position = SCNVector3(140, 0, 150)
//        bNodeFree.frozenPosition = bNodeFrozen.position
//        freeArray.append(bNodeFree)
//        scene.rootNode.addChildNode(bNodeFree)
//
//        cNodeFree = LetterNode(geometry: cGeo.copy() as! Letter, frozen: false)
//        cNodeFree.position = SCNVector3(140, 0, 120)
//        cNodeFree.frozenPosition = cNodeFrozen.position
//        freeArray.append(cNodeFree)
//        //        cNodeFree.physicsBody = physicsBody
//        scene.rootNode.addChildNode(cNodeFree)

    }
    
    func loadNodesFrozen() {
        
        aNodeFrozen = LetterNode(geometry: aGeo, frozen: true)
        aNodeFrozen.position = SCNVector3(0, 50, 0)
        frozenArray.append(aNodeFrozen)
        scene.rootNode.addChildNode(aNodeFrozen)
        
        bNodeFrozen = LetterNode(geometry: bGeo, frozen: true)
        bNodeFrozen.position = SCNVector3(17, 50, 0)
        scene.rootNode.addChildNode(bNodeFrozen)
        
        cNodeFrozen = LetterNode(geometry: cGeo, frozen: true)
        cNodeFrozen.position = SCNVector3(34, 50, 0)
        scene.rootNode.addChildNode(cNodeFrozen)
        
//        dNodeFrozen = LetterNode(geometry: dGeoF, frozen: true)
//        dNodeFrozen.position = SCNVector3(51, 50, 0)
//        scene.rootNode.addChildNode(dNodeFrozen)
//
//        eNodeFrozen = LetterNode(geometry: eGeoF, frozen: true)
//        eNodeFrozen.position = SCNVector3(68, 50, 0)
//        scene.rootNode.addChildNode(eNodeFrozen)
//
//        fNodeFrozen = LetterNode(geometry: fGeoF, frozen: true)
//        fNodeFrozen.position = SCNVector3(85, 50, 0)
//        scene.rootNode.addChildNode(fNodeFrozen)
//
//        gNodeFrozen = LetterNode(geometry: gGeoF, frozen: true)
//        gNodeFrozen.position = SCNVector3(102, 50, 0)
//        scene.rootNode.addChildNode(gNodeFrozen)
//
//        hNodeFrozen = LetterNode(geometry: hGeoF, frozen: true)
//        hNodeFrozen.position = SCNVector3(119, 50, 0)
//        scene.rootNode.addChildNode(hNodeFrozen)
//
//        iNodeFrozen = LetterNode(geometry: iGeoF, frozen: true)
//        iNodeFrozen.position = SCNVector3(136, 50, 0)
//        scene.rootNode.addChildNode(iNodeFrozen)
//
//        jNodeFrozen = LetterNode(geometry: jGeoF, frozen: true)
//        jNodeFrozen.position = SCNVector3(153, 50, 0)
//        scene.rootNode.addChildNode(jNodeFrozen)
//
//        kNodeFrozen = LetterNode(geometry: kGeoF, frozen: true)
//        kNodeFrozen.position = SCNVector3(170, 50, 0)
//        scene.rootNode.addChildNode(kNodeFrozen)
//
//        lNodeFrozen = LetterNode(geometry: lGeoF, frozen: true)
//        lNodeFrozen.position = SCNVector3(187, 50, 0)
//        scene.rootNode.addChildNode(lNodeFrozen)
//
//        mNodeFrozen = LetterNode(geometry: mGeoF, frozen: true)
//        mNodeFrozen.position = SCNVector3(204, 50, 0)
//        scene.rootNode.addChildNode(mNodeFrozen)
//
//        nNodeFrozen = LetterNode(geometry: nGeoF, frozen: true)
//        nNodeFrozen.position = SCNVector3(221, 50, 0)
//        scene.rootNode.addChildNode(nNodeFrozen)
//
//        oNodeFrozen = LetterNode(geometry: oGeoF, frozen: true)
//        oNodeFrozen.position = SCNVector3(238, 50, 0)
//        scene.rootNode.addChildNode(oNodeFrozen)
//
//        pNodeFrozen = LetterNode(geometry: pGeoF, frozen: true)
//        pNodeFrozen.position = SCNVector3(255, 50, 0)
//        scene.rootNode.addChildNode(pNodeFrozen)
//
//        qNodeFrozen = LetterNode(geometry: qGeoF, frozen: true)
//        qNodeFrozen.position = SCNVector3(40, 20, 0)
//        scene.rootNode.addChildNode(qNodeFrozen)
//
//        rNodeFrozen = LetterNode(geometry: rGeoF, frozen: true)
//        rNodeFrozen.position = SCNVector3(60, 20, 0)
//        scene.rootNode.addChildNode(rNodeFrozen)
//
//        sNodeFrozen = LetterNode(geometry: sGeoF, frozen: true)
//        sNodeFrozen.position = SCNVector3(80, 20, 0)
//        scene.rootNode.addChildNode(sNodeFrozen)
//
//        tNodeFrozen = LetterNode(geometry: tGeoF, frozen: true)
//        tNodeFrozen.position = SCNVector3(100, 20, 0)
//        scene.rootNode.addChildNode(tNodeFrozen)
//
//        uNodeFrozen = LetterNode(geometry: uGeoF, frozen: true)
//        uNodeFrozen.position = SCNVector3(120, 20, 0)
//        scene.rootNode.addChildNode(uNodeFrozen)
//
//        vNodeFrozen = LetterNode(geometry: vGeoF, frozen: true)
//        vNodeFrozen.position = SCNVector3(140, 20, 0)
//        scene.rootNode.addChildNode(vNodeFrozen)
//
//        wNodeFrozen = LetterNode(geometry: wGeoF, frozen: true)
//        wNodeFrozen.position = SCNVector3(160, 20, 0)
//        scene.rootNode.addChildNode(wNodeFrozen)
//
//        xNodeFrozen = LetterNode(geometry: xGeoF, frozen: true)
//        xNodeFrozen.position = SCNVector3(180, 20, 0)
//        scene.rootNode.addChildNode(xNodeFrozen)
//
//        yNodeFrozen = LetterNode(geometry: yGeoF, frozen: true)
//        yNodeFrozen.position = SCNVector3(200, 20, 0)
//        scene.rootNode.addChildNode(yNodeFrozen)
//
//        zNodeFrozen = LetterNode(geometry: zGeoF, frozen: true)
//        zNodeFrozen.position = SCNVector3(220, 20, 0)
//        scene.rootNode.addChildNode(zNodeFrozen)
        
    }
    
    
    
    
}
