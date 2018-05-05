//
//  ramp.swift
//  ramp-up
//
//  Created by Patrik Kemeny on 5/5/18.
//  Copyright © 2018 Patrik Kemeny. All rights reserved.
//

import Foundation
import SceneKit

class Ramp {
    
    class func getPipe() -> SCNNode{
        let obj = SCNScene(named: "art.scnassets/pipe")
        let node = obj?.rootNode.childNode(withName: "pipe", recursively: true)!
        node?.scale = SCNVector3Make(0.0022, 0.0022, 0.0022)
        node?.position = SCNVector3Make(-1, 0.2, -1)
        return node!
    }
    
    class func getPyramid() -> SCNNode{
        let obj = SCNScene(named: "art.scnassets/pyramid")
        let node = obj?.rootNode.childNode(withName: "pyramind", recursively: true)!
        node?.scale = SCNVector3Make(0.0052, 0.0052, 0.0052)
        node?.position = SCNVector3Make(-1, -0.65, -1)
        return node!
    }
    
    class func getQuarter() -> SCNNode{
        let obj = SCNScene(named: "art.scnassets/quarted")
        let node = obj?.rootNode.childNode(withName: "quarted", recursively: true)!
        node?.scale = SCNVector3Make(0.0058, 0.0058, 0.0058 )
        node?.position = SCNVector3Make(-1, -2, -1)
        return node! 
    }
    class func startRotation(node: SCNNode){
    //rotation
    let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
    node.runAction(rotate)
    }
}








