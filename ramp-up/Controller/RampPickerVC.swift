//
//  RampPickerVC.swift
//  ramp-up
//
//  Created by Patrik Kemeny on 5/5/18.
//  Copyright © 2018 Patrik Kemeny. All rights reserved.
//

import UIKit
import SceneKit

class RampPickerVC: UIViewController {
    
    var sceneView: SCNView!
    var size: CGSize!
    
    //we will not use a storyboard we will create it programaticly we are awesome
    //so the view will be a popOver subviews
    
    init(size: CGSize){
        super.init(nibName: nil, bundle: nil)
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.frame = CGRect(origin: CGPoint.zero, size: size) //make the frame big as screen
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        view.insertSubview(sceneView, at: 0) //programatically added a subview
        
        //load ramp.scn scene
        let scene = SCNScene(named: "art.scnassets/ramps.scn")!
        sceneView.scene = scene
        
        //to get away with depht of object we are usign ortGrophic projection camera
        
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        
        var obj = SCNScene(named: "art.scnassets/pipe.dae") //cretae a scene / one scnene can hold one or more object
        //so we pick his node not the whole scene .. "pipe" is referencing to child named PIPE what we create in inspector
        var node = obj?.rootNode.childNode(withName: "pipe", recursively: true)!
        
        node?.scale = SCNVector3Make(0.0022, 0.0022, 0.0022)
        node?.position = SCNVector3Make(-1, 0.2, -1)
        scene.rootNode.addChildNode(node!)
        
        
        obj = SCNScene(named: "art.scnassets/pyramid.dae")
        node = obj?.rootNode.childNode(withName: "pyramind", recursively: true)!
        node?.scale = SCNVector3Make(0.0052, 0.0052, 0.0052)
        node?.position = SCNVector3Make(-1, -0.65, -1)
        scene.rootNode.addChildNode(node!)
        
        obj = SCNScene(named: "art.scnassets/quarter.dae")
        node = obj?.rootNode.childNode(withName: "quarter", recursively: true)!
        node?.scale = SCNVector3Make(0.0058, 0.0058, 0.0058 )
        node?.position = SCNVector3Make(-1, -2, -1)
        scene.rootNode.addChildNode(node!)
        
        preferredContentSize = size //to avoid problems
        
    }

   
}
