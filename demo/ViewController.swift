//
//  ViewController.swift
//  demo
//
//  Created by Martín Alegria Vizcaya on 01/03/18.
//  Copyright © 2018 Martín Alegria Vizcaya. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @objc func retPressed(ender: UIButton) {
        let ret = self.storyboard?.instantiateViewController(withIdentifier: "menu") as! menuViewController
        self.present(ret, animated: true, completion: nil)
    }
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        
        let retButton = UIButton(frame: CGRect(x: 16, y: 36, width: 45, height: 45))
        retButton.backgroundColor = .black
        retButton.setTitle("RET", for: .normal)
        retButton.addTarget(self, action:#selector(retPressed), for: .touchUpInside)
        self.view.addSubview(retButton)
        
        //Set view delegate
        sceneView.delegate = self
        

        let sun = SCNSphere(radius: 10) //BIG: 10
        let sunMaterial = SCNMaterial()
        
        sunMaterial.diffuse.contents = UIImage(named: "art.scnassets/sun.jpg")
        sun.materials = [sunMaterial]
        
        let sunNode = SCNNode()
        sunNode.position = SCNVector3(x:15, y: 0, z: -0.5) //BIG: 10 (x:15, y: 0, z: -0.5
        sunNode.geometry = sun
        sceneView.scene.rootNode.addChildNode(sunNode)
        
        //Mercury
        let mercury = SCNSphere(radius: 0.07) //BIG: 0.07
        let mercuryMaterial = SCNMaterial()
        
        mercuryMaterial.diffuse.contents = UIImage(named: "art.scnassets/mercury.jpg")
        mercury.materials = [mercuryMaterial]
        
        let mercuryNode = SCNNode()
        mercuryNode.position = SCNVector3(x:2, y: 0, z: -0.5) //BIG (x:2, y: 0, z: -0.5)
        mercuryNode.geometry = mercury
        sceneView.scene.rootNode.addChildNode(mercuryNode)
        
        //Venus
        let venus = SCNSphere(radius: 0.198) //BIG = 0.198
        let venusMaterial = SCNMaterial()
        
        venusMaterial.diffuse.contents = UIImage(named: "art.scnassets/venus.jpg")
        venus.materials = [venusMaterial]
        
        let venusNode = SCNNode()
        venusNode.position = SCNVector3(x:1, y: 0, z: -0.5) //BIG: (x:1, y: 0, z: -0.5)
        venusNode.geometry = venus
        sceneView.scene.rootNode.addChildNode(venusNode)
        
        //Earth
        let earth = SCNSphere(radius: 0.2) //BIG: 0.2
        let earthMaterial = SCNMaterial()
        
        earthMaterial.diffuse.contents = UIImage(named: "art.scnassets/earth.jpg")
        earth.materials = [earthMaterial]
        
        let earthNode = SCNNode()
        earthNode.position = SCNVector3(x:0, y: 0, z: -0.5) //BIG: (x:0, y: 0, z: -0.5)
        earthNode.geometry = earth
        sceneView.scene.rootNode.addChildNode(earthNode)
        
        //Moon
        let moon = SCNSphere(radius: 0.05) //BIG: 0.05
        let moonMaterial = SCNMaterial()
        
        moonMaterial.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        moon.materials = [moonMaterial]
        
        let moonNode = SCNNode()
        moonNode.position = SCNVector3(x:0, y:0, z :0) // BIG: (x:0, y:0, z :0)
        moonNode.geometry = moon
        
        sceneView.scene.rootNode.addChildNode(moonNode)
        
        //Mars
        let mars = SCNSphere(radius: 0.104) //BIG: (radius: 0.104)
        let marsMaterial = SCNMaterial()
        
        marsMaterial.diffuse.contents = UIImage(named: "art.scnassets/mars.jpg")
        mars.materials = [marsMaterial]
        
        let marsNode = SCNNode()
        marsNode.position = SCNVector3(x:-1, y: 0, z: -0.5) //BIG: (x:-1, y: 0, z: -0.5)
        marsNode.geometry = mars
        sceneView.scene.rootNode.addChildNode(marsNode)
        
        //Jupyter
        let jupiter = SCNSphere(radius: 2.25)// BIG: (radius: 2.25)
        let jupiterMat = SCNMaterial()
        
        jupiterMat.diffuse.contents = UIImage(named: "art.scnassets/jupyter.jpg")
        jupiter.materials = [jupiterMat]
        
        let jupiterNode = SCNNode()
        jupiterNode.position = SCNVector3(x:-5, y: 0, z: -0.5) //BIG: (x:-5, y: 0, z: -0.5)
        jupiterNode.geometry = jupiter
        sceneView.scene.rootNode.addChildNode(jupiterNode)
        
        //Saturn
        let saturn = SCNSphere(radius: 1.84) //BIG: 1.84
        let saturnMat = SCNMaterial()
        
        saturnMat.diffuse.contents = UIImage(named: "art.scnassets/saturn.jpg")
        saturn.materials = [saturnMat]
        
        let saturnNode = SCNNode()
        saturnNode.position = SCNVector3(x:-14, y: 0, z: -0.5)//BIG:(x:-14, y: 0, z: -0.5)
        saturnNode.geometry = saturn
        sceneView.scene.rootNode.addChildNode(saturnNode)
        
        let rings = SCNTorus(ringRadius: 3.2, pipeRadius:0.2) // BIG: (ringRadius: 3.2, pipeRadius:0.2)
        
        let ringsNode = SCNNode()
        ringsNode.position = SCNVector3(x:-14, y: 0, z: -0.5)//BIG: (x:-14, y: 0, z: -0.5)
        ringsNode.geometry = rings
        sceneView.scene.rootNode.addChildNode(ringsNode)
        
      
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
